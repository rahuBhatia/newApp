import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/authModel.dart';
import 'screens/auth/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthModel(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => UserModel(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProxyProvider<AuthModel, AuthModel>(
          create: (BuildContext context) {
            return AuthModel();
          },
          update: (ctx, auth, previousData) {
            return previousData!..update(auth);
          },
          child: const LoginPage(),
        ),
      ),
    );
  }
}
