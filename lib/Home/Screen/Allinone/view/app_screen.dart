import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/brouser_provider.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  // BrouserProvider? brouserProvidertrue,brouserProviderfalse;
  brouserProvider? bt,bf;
  @override
  Widget build(BuildContext context) {
    // brouserProviderfalse = Provider.of<BrouserProvider>(context,listen: false);
    // brouserProvidertrue = Provider.of<BrouserProvider>(context,listen: true);
    bf = Provider.of<brouserProvider>(context,listen: false);
    bt = Provider.of<brouserProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Multi App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: bf!.appgame.length,itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "Bro",arguments: index);
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),),
                    child: Image.asset("${bf!.img[index]}"),
                  ),
                ),
              );
            },),
          )
        ],
      ),
    ),);
  }
}
