import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import '../../fournisseurs/provider/payment_provider.dart';
import '../../fournisseurs/provider/client_profile_provider.dart';
import '../../models/order.dart';
import '../../models/method_enum.dart';
import '../../models/payment.dart';
import 'paiement_confirmation_screen.dart';

class PaymentMethodSelectionScreen extends ConsumerWidget {
  final Order order;

  const PaymentMethodSelectionScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientProfile = ref.watch(clientProfileNotifierProvider).value;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Paiement', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildOrderSummary(context),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Choisir une méthode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: MethodEnum.values.map((method) {
                  return _buildPaymentMethodCard(context, ref, method, clientProfile);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        children: [
          Text('Total à régler', style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
          const Gap(8),
          Text(
            '${order.total.toStringAsFixed(2)} F',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.green),
          ),
          const Gap(16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Text('Commande #${order.id}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard(BuildContext context, WidgetRef ref, MethodEnum method, dynamic profile) {
    final bool isBalance = method == MethodEnum.balance;
    final double balance = profile?.balance ?? 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(14)),
          child: Icon(_getMethodIcon(method), color: Colors.black87),
        ),
        title: Text(method.label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: isBalance 
          ? Text('Solde : ${balance.toStringAsFixed(0)} F', style: TextStyle(color: balance >= order.total ? Colors.green : Colors.red, fontSize: 12))
          : const Text('Paiement sécurisé', style: TextStyle(fontSize: 12)),
        trailing: const Icon(Iconsax.arrow_right_3, size: 18, color: Colors.grey),
        onTap: () => _showPaymentDialog(context, ref, method, balance),
      ),
    );
  }

  IconData _getMethodIcon(MethodEnum method) {
    switch (method) {
      case MethodEnum.card: return Iconsax.card;
      case MethodEnum.mobile: return Iconsax.mobile;
      case MethodEnum.bank: return Iconsax.bank;
      case MethodEnum.paypal: return Iconsax.wallet_check;
      case MethodEnum.balance: return Iconsax.empty_wallet;
      default: return Iconsax.money;
    }
  }

  void _showPaymentDialog(BuildContext context, WidgetRef ref, MethodEnum method, double currentBalance) {
    final controller = TextEditingController(text: order.total.toStringAsFixed(0));
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: Text('Confirmer le montant', style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Vous allez payer via ${method.label}', style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
            const Gap(20),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              decoration: InputDecoration(
                suffixText: 'F',
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Annuler', style: TextStyle(color: Colors.grey.shade600))),
          ElevatedButton(
            onPressed: () async {
              final val = double.tryParse(controller.text);
              if (val == null || val <= 0) return;
              
              Navigator.pop(ctx);
              _executePayment(context, ref, method, val);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  Future<void> _executePayment(BuildContext context, WidgetRef ref, MethodEnum method, double amount) async {
    final notifier = ref.read(paymentNotifierProvider.notifier);
    final success = await notifier.payerCommande(orderId: order.id, amount: amount, method: method);

    final payment = ref.read(paymentNotifierProvider).value;

    if (context.mounted) {
      if (success && payment != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => PaymentConfirmationScreen(payment: payment)),
        );
      } else {
        final errorMsg = notifier.lastErrorMessage ?? 'Échec du paiement';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    }
  }
}
