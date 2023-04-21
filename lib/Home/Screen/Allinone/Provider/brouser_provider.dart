import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class brouserProvider extends ChangeNotifier {

  double ProgressWeb = 0;
  InAppWebViewController? inAppWebViewController;
  void changeProgress(double Progress){
    ProgressWeb = Progress;
    notifyListeners();
  }
  List name = [
    "Netflix",
    "Amazon",
    "Meesho",
    "Flipkart",
    "Pinterest",
    "Twitter",
    "Linkedin",
    "Tic-Tac-Toc",
  ];
  List img = [
    "assets/images/Netflix.png",
    "assets/images/amezon.jpg",
    "assets/images/instagram.jpg",
    "assets/images/Facebook.png",
    "assets/images/sonyliv.png",
    "assets/images/twitter.png",
    "assets/images/linkedin.jpg",
    "assets/images/hostar.png",
  ];
  List appgame = [
    Uri.parse("https://www.netflix.com/in/"),
    Uri.parse("https://www.amazon.in/"),
    Uri.parse("https://www.instagram.com/"),
    Uri.parse("https://www.facebook.com/"),
    Uri.parse("https://www.sonyliv.com/"),
    Uri.parse("https://twitter.com/"),
    Uri.parse("https://www.linkedin.com/feed/"),
    Uri.parse("https://www.hotstar.com/in/home?ref=%2Fin"),
  ];
}
