import 'package:all_in_one/Home/Screen/Allinone/Provider/brouser_provider.dart';
import 'package:all_in_one/Home/Screen/Allinone/view/app_screen.dart';
import 'package:all_in_one/Home/Screen/Allinone/view/brouser_screen.dart';
import 'package:all_in_one/Home/Screen/Allinone/view/mainbrouser_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => brouserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          //'/':(context) => MainBrouserScreen(),
           '/':(context) => AppScreen(),
           'Bro':(context) => BrouserScreen(),
        },
      ),
    ),
  );
}