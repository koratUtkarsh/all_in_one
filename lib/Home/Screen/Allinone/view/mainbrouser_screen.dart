import 'package:all_in_one/Home/Screen/Allinone/Provider/brouser_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class MainBrouserScreen extends StatefulWidget {
  const MainBrouserScreen({Key? key}) : super(key: key);

  @override
  State<MainBrouserScreen> createState() => _MainBrouserScreenState();
}

class _MainBrouserScreenState extends State<MainBrouserScreen> {
  brouserProvider? brouser_providertrue, brouser_providerfalse;
  TextEditingController txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    brouser_providerfalse =
        Provider.of<brouserProvider>(context, listen: false);
    brouser_providertrue = Provider.of<brouserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 1)]),
                    child: TextField(
                      controller: txtsearch,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {
                              var NewLink = txtsearch.text;

                              brouser_providertrue!.inAppWebViewController!.loadUrl(
                                urlRequest: URLRequest(
                                  url: Uri.parse("https://www.google.com/search?q=$NewLink"),
                                ),
                              );
                            },
                            icon: Icon(Icons.search),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  value: brouser_providertrue!.ProgressWeb,
                ),
                Expanded(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse("https://www.google.com/"),
                    ),
                    onWebViewCreated: (controller) {
                      brouser_providertrue!.inAppWebViewController = controller;
                    },
                    onLoadError: (controller, url, code, message) {
                      brouser_providertrue!.inAppWebViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      brouser_providertrue!.inAppWebViewController = controller;
                    },
                    onLoadStop: (controller, url) {
                      brouser_providertrue!.inAppWebViewController = controller;
                    },
                    onProgressChanged: (controller, progress) {
                      brouser_providerfalse!.changeProgress(progress / 100);
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        brouser_providertrue!.inAppWebViewController!.goBack();
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        brouser_providertrue!.inAppWebViewController!.reload();
                      },
                      icon: Icon(Icons.refresh, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        brouser_providertrue!.inAppWebViewController!
                            .goForward();
                      },
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
