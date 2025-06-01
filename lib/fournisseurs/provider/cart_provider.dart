import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../core/network/dio_provider.dart';
import '../../models/cart.dart';
import '../../pagination/paginated_cart_list.dart';
import '../../services/cart_service.dart';
import '../notifications/cart_notifier.dart';
import '../repositories/cart_repository.dart';




final cartServiceProvider = Provider<CartService>((ref) {
  final dio = ref.watch(dioProvider);
  return CartService(dio);
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final service = ref.watch(cartServiceProvider);
  return CartRepository(service);
});

final cartNotifierProvider = StateNotifierProvider<CartNotifier, AsyncValue<PaginatedCartList>>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return CartNotifier(repo);
});

final cartByIdProvider = FutureProvider.family<Cart, int>((ref, id) async {
  final repo = ref.watch(cartRepositoryProvider);
  return repo.getCart(id);
});
