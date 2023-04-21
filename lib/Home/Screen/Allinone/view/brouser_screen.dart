import 'package:all_in_one/Home/Screen/Allinone/Provider/brouser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class BrouserScreen extends StatefulWidget {
  const BrouserScreen({Key? key}) : super(key: key);

  @override
  State<BrouserScreen> createState() => _BrouserScreenState();
}

class _BrouserScreenState extends State<BrouserScreen> {
  brouserProvider? bt,bf;
  @override
  Widget build(BuildContext context) {
    bf = Provider.of<brouserProvider>(context,listen: false);
    bt = Provider.of<brouserProvider>(context,listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(child: Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("${bf!.appgame[index]}"),),
      )
    ),);
  }
}
