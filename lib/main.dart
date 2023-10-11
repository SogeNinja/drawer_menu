import 'package:drawer_menu/models/profile_model.dart';
import 'package:drawer_menu/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context) => ProfileCollection(),
          child: const MainApp(),
        ),
      ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.dark, 
        useMaterial3: true,
      ),
      routerConfig: appRouterConfig
    );
  }
}
