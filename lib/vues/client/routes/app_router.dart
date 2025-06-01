// 📁 lib/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../gesti_screen/invoice_screen.dart';
import '../gesti_screen/loyalty_screen.dart';
import '../gesti_screen/order_history_screen.dart';
import '../gesti_screen/refund_request_screen.dart';
import '../gesti_screen/return_request_screen.dart';
import 'forms/exchange_form_screen.dart';
import 'forms/invoice_detail_screen.dart';
import 'forms/order_detail_screen.dart';
import 'forms/refund_form_screen.dart';



final appRouter = GoRouter(
  initialLocation: '/orders',
  routes: [
    GoRoute(
      path: '/orders',
      name: 'orders',
      builder: (ctx, state) => const OrderHistoryScreen(),
      routes: [
        // Détail d’une commande
        GoRoute(
          path: ':orderId',
          name: 'order_detail',
          builder: (ctx, state) {
            final id = int.tryParse(state.pathParameters['orderId']!);
            return id == null
                ? const Scaffold(body: Center(child: Text('ID invalide')))
                : OrderDetailScreen(orderId: id); // à implémenter
          },
        ),
      ],
    ),
    GoRoute(
      path: '/exchange',
      name: 'exchange',
      builder: (ctx, state) => const ReturnRequestScreen(),
      routes: [
        GoRoute(
          path: 'new',
          name: 'exchange_new',
          builder: (ctx, state) => const ExchangeFormScreen(), // formulaire
        ),
      ],
    ),
    GoRoute(
      path: '/refund',
      name: 'refund',
      builder: (ctx, state) => const RefundRequestScreen(),
      routes: [
        GoRoute(
          path: 'new',
          name: 'refund_new',
          builder: (ctx, state) => const RefundFormScreen(), // formulaire
        ),
      ],
    ),
    GoRoute(
      path: '/invoices',
      name: 'invoices',
      builder: (ctx, state) => const InvoiceScreen(),
      routes: [
        GoRoute(
          path: ':invoiceId',
          name: 'invoice_view',
          builder: (ctx, state) {
            final id = int.tryParse(state.pathParameters['invoiceId']!);
            return id == null
                ? const Scaffold(body: Center(child: Text('ID invalide')))
                : InvoiceDetailScreen(invoiceId: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/loyalty',
      name: 'loyalty',
      builder: (ctx, state) => const LoyaltyScreen(),
    ),
  ],
);
