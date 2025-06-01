// cart_item_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../core/network/dio_provider.dart';
import '../../models/cart_item.dart';
import '../../pagination/paginated_cart_item_list.dart';
import '../../services/cart_item_service.dart';
import '../notifications/cart_item_notifier.dart';
import '../repositories/cart_item_repository.dart';




final cartItemServiceProvider = Provider<CartItemService>((ref) {
  final dio = ref.watch(dioProvider);
  return CartItemService(dio);
});

final cartItemRepositoryProvider = Provider<CartItemRepository>((ref) {
  final service = ref.watch(cartItemServiceProvider);
  return CartItemRepository(service);
});

final cartItemNotifierProvider = StateNotifierProvider<CartItemNotifier, AsyncValue<PaginatedCartItemList>>((ref) {
  final repo = ref.watch(cartItemRepositoryProvider);
  return CartItemNotifier(repo);
});

final cartItemByIdProvider = FutureProvider.family<CartItem, int>((ref, id) async {
  final repo = ref.watch(cartItemRepositoryProvider);
  return repo.getCartItem(id);
});
