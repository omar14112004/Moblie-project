import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gearup/src/data/providers/favorites_provider.dart';
import 'package:gearup/src/features/checkout/presentation/screens/my_orders_screen.dart';
import 'package:gearup/src/features/checkout/presentation/screens/order_screen.dart';
import 'package:gearup/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:gearup/src/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:gearup/src/features/cart/presentation/screens/cart_screen.dart';
import 'package:gearup/src/core/themes/app_theme.dart';
import 'package:gearup/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:gearup/src/features/auth/presentation/screens/login_screen.dart';
import 'package:gearup/src/data/providers/cart_provider.dart';
import 'package:gearup/src/data/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'GearUp',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,

        initialRoute: '/signup',
        routes: {
          '/signup': (context) => const SignupScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/cart': (context) => const CartScreen(),
          '/favorites': (context) => const FavoritesScreen(),
          '/order': (context) => const OrderScreen(totalAmount: 0), // Default value
          '/my-orders': (context) => const MyOrdersScreen(),
          //'/profile': (context) => const ProfileScreen(),

        },
      ),
    );
  }
}
