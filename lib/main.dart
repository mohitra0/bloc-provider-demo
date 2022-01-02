import 'package:flutter/material.dart';
import 'package:india_today/controllers/astroprovider.dart';
import 'package:india_today/view/screens/astro_bloc.dart';
import 'package:india_today/view/screens/navigation.dart/navigation.dart';
import 'package:india_today/view/screens/astro_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AstroProvider>(
          create: (_) => AstroProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: AstroBlocHome(),
      ),
    );
  }
}
