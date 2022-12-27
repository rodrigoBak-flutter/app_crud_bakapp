import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_crud_bakapp/src/screens/screens.dart';
import 'package:app_crud_bakapp/src/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductsService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'checking',
      routes: {
        'checking': (_) => CheckAuthScreen(),
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreen(),
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.lightBlue),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.lightBlue, elevation: 0),
      ),
    );
  }
}
