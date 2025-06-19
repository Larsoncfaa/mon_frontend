import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../models/delivery_person.dart';
import '../../pagination/paginated_delivery_person_list.dart';
import '../repositories/delivery_person_repository.dart';

class DeliveryPersonNotifier extends StateNotifier<AsyncValue<PaginatedDeliveryPersonList>> {
  final DeliveryPersonRepository _repository;

  DeliveryPersonNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadPage();
  }

  /// 📥 Charge une page de livreurs (ou URL donnée)
  Future<void> loadPage({String? url}) async {
    debugPrint('📦 [Notifier] Chargement de la page des livreurs...');
    state = const AsyncValue.loading();
    try {
      final page = await _repository.fetchPage(url: url);
      debugPrint('✅ [Notifier] Page des livreurs chargée : ${page.results.length} résultats');
      state = AsyncValue.data(page);
    } catch (e, st) {
      debugPrint('❌ [Notifier] Erreur loadPage: $e');
      state = AsyncValue.error(e, st);
    }
  }

  /// ⏭️ Charge la page suivante si disponible
  Future<void> loadNext() async {
    final page = state.value;
    if (page?.next != null) {
      debugPrint('➡️ [Notifier] Page suivante détectée');
      await loadPage(url: page!.next);
    } else {
      debugPrint('ℹ️ [Notifier] Pas de page suivante');
    }
  }

  /// ⏮️ Charge la page précédente si disponible
  Future<void> loadPrevious() async {
    final page = state.value;
    if (page?.previous != null) {
      debugPrint('⬅️ [Notifier] Page précédente détectée');
      await loadPage(url: page!.previous);
    } else {
      debugPrint('ℹ️ [Notifier] Pas de page précédente');
    }
  }

  /// ✅ Marque une livraison comme livrée
  Future<void> markDelivered(int id) async {
    try {
      debugPrint('📥 [Notifier] Marquage comme livré : ID $id');
      await _repository.markDelivered(id);
      await loadPage(); // Recharger la liste
    } catch (e, st) {
      debugPrint('❌ [Notifier] Erreur markDelivered: $e');
      state = AsyncValue.error(e, st);
    }
  }

  /// 🔁 Réassigne une livraison à un nouveau livreur
  Future<void> reassign(int id, int newUserId) async {
    try {
      debugPrint('📥 [Notifier] Réassignation livraison $id à user $newUserId');
      await _repository.reassign(id, newUserId);
      await loadPage(); // Recharger la liste
    } catch (e, st) {
      debugPrint('❌ [Notifier] Erreur reassign: $e');
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> createDeliveryPerson(Map<String, dynamic> data) async {
    try {
      await _repository.create(data); // PAS de cast
      await loadPage();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
  /// 🗑️ Supprime un livreur
  Future<void> delete(int id) async {
    try {
      debugPrint('🗑️ [Notifier] Suppression du livreur $id');
      await _repository.delete(id);
      await loadPage(); // Recharger la liste après suppression
    } catch (e, st) {
      debugPrint('❌ [Notifier] Erreur delete: $e');
      state = AsyncValue.error(e, st);
    }
  }
}
