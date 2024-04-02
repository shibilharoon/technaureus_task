import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technaureus_task/controller/api_provider.dart';
import 'package:technaureus_task/controller/search_provider.dart';

import 'package:technaureus_task/view/bottombar.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ApiProvider(),),ChangeNotifierProvider(create: (context) => SearchProvider(),)],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
      ),
    );
  }
}