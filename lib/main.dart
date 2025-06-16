import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/vues/agriculteur/forme/Selection_form_screen.dart';
import 'package:maliag/vues/agriculteur/selection_list_page.dart';
import 'package:maliag/vues/agriculteur/statistique.dart';
import 'package:maliag/vues/agriculteur/suivi_logistique_agriculteur_screen.dart';
import 'package:maliag/vues/auth/profile_screen.dart';
import 'package:maliag/vues/client/cart_screen.dart';
import 'package:maliag/vues/client/order_confirmation_screen.dart';
import 'package:maliag/vues/client/order_list.dart';
import 'package:maliag/vues/commun/deconnexion.dart';

import 'core/utils/logger.dart';
import 'fournisseurs/provider/auth_provider.dart';
import 'models/order.dart';
import 'models/user_role.dart';

import 'package:maliag/vues/agriculteur/agri_management_screen.dart';
import 'package:maliag/vues/agriculteur/batch_management_screen.dart';
import 'package:maliag/vues/agriculteur/dashboard_screen.dart';
import 'package:maliag/vues/agriculteur/delivery_management_screen.dart';
import 'package:maliag/vues/agriculteur/forme/form_stock_movement_screen.dart';
import 'package:maliag/vues/agriculteur/order_management_screen.dart';
import 'package:maliag/vues/agriculteur/product_management_screen.dart';
import 'package:maliag/vues/agriculteur/stock_management_screen.dart';
import 'package:maliag/vues/agriculteur/warehouse_screen.dart';
import 'package:maliag/vues/auth/login_screen.dart';
import 'package:maliag/vues/auth/register_screen.dart';
import 'package:maliag/vues/client/home_screen.dart';
import 'package:maliag/vues/livreur/livreur_dashboard_screen.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    Logger.error('FlutterError', details.exception, details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    Logger.error('Erreur Dart non Flutter', error, stack);
    return true;
  };

  runApp(const ProviderScope(child: MyApp()));
}

/// Écran de chargement temporaire (utilisé pendant l'authentification)
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

/// Point d’entrée de l’application Flutter
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return MaterialApp(
      title: 'MaliAg',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,

      // ✅ Ajout des localizations pour résoudre l’erreur
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'), // français
        Locale('en'), // anglais (par défaut si rien de défini)
      ],

      home: authState.when(
        loading: () => const SplashScreen(),
        error: (error, _) => const LoginScreen(),
        data: (user) {
          if (user == null) return const LoginScreen();
          switch (user.role) {
            case UserRole.agriculteur:
              return const DashboardAgriculteurScreen();
            case UserRole.client:
              return const HomeScreen();
            case UserRole.livreur:
              return const LivreurDashboardScreen();
          }
        },
      ),

      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/client': (context) => const HomeScreen(),
        '/livreur': (context) => const LivreurDashboardScreen(),
        '/agriculteur': (context) => const DashboardAgriculteurScreen(),
        '/ajouterMouvement': (context) => const AjouterStockMovementScreen(),
        '/gestion': (ctx) => const GestionAgriculteurScreen(),
        '/batches': (ctx) => const BatchManagementScreen(),
        '/deliveries': (ctx) => const DeliveryManagementScreen(),
        '/orders': (ctx) => const OrderManagementScreen(),
        '/products': (ctx) => const ProductManagementScreen(),
        '/stock': (ctx) => const StockManagementScreen(),
        '/warehouses': (ctx) => const WarehouseListScreen(),
        '/suivi-logistique': (context) => const SuiviLogistiqueAgriculteurScreen(),
        '/selections': (_) => const SelectionListPage(),
        '/selection_form': (_) => const SelectionFormPage(),
        '/stock-stats': (context) => const StockStatsScreen(),
        '/logout': (context) => const LogoutScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/cart': (context) => const CartScreen(),
        '/order-confirmation': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Order;
          return OrderConfirmationScreen(order: args);
          },
        '/orders-list': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as List<Order>;
          return OrdersListScreen(orders: args);
        },

      },
    );
  }
}
