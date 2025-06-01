import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/models/user.dart';
import 'package:maliag/vues/agriculteur/dashboard_screen.dart';
import 'package:maliag/vues/auth/login_screen.dart';
import 'package:maliag/vues/auth/register_screen.dart';
import 'package:maliag/vues/client/home_screen.dart';
import 'package:maliag/vues/livreur/livreur_dashboard_screen.dart';

import 'fournisseurs/provider/auth_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

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
          style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: authState.when(
        initial: () => const LoginScreen(),    // état initial : pas d'utilisateur
        loading: () => const SplashScreen(),
        error:   (_) => const LoginScreen(),
        data:    (user) {
          if (user == null) return const LoginScreen();
          switch (user.role) {
            case UserRole.agriculteur:
              return const DashboardAgriculteurScreen();
            case UserRole.client:
              return const HomeScreen();
            case UserRole.livreur:
              return const LivreurDashboardScreen();
            default:
              return const LoginScreen();
          }
        },
      ),
      routes: {
        '/register':   (context) => const RegisterScreen(),
        '/login':      (context) => const LoginScreen(),
        '/client':     (context) => const HomeScreen(),
        '/livreur':    (context) => const LivreurDashboardScreen(),
        '/agriculteur':(context) => const DashboardAgriculteurScreen(),
      },
    );
  }
}
