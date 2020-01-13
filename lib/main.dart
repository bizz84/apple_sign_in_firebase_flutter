import 'package:apple_sign_in_firebase_flutter/apple_sign_in_available.dart';
import 'package:apple_sign_in_firebase_flutter/auth_service.dart';
import 'package:apple_sign_in_firebase_flutter/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // Fix for: Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized.
  WidgetsFlutterBinding.ensureInitialized();
  final appleSignInAvailable = await AppleSignInAvailable.check();
  runApp(Provider<AppleSignInAvailable>(
    create: (_) => appleSignInAvailable,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<AuthService>(
        create: (_) => AuthService(),
        child: SignInPage(),
      ),
    );
  }
}
