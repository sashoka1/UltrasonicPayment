import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  String webUrl;

  WebViewScreen({this.webUrl});

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewScreen> {
  InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
          url: Uri.parse("https://vibhupuri.github.io/react-material-admin/static/main.html")),
      androidOnPermissionRequest: (controller, origin, resources) async {
        return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
      },
      onWebViewCreated: (InAppWebViewController controller) {
        _webViewController = controller;

        _webViewController.addJavaScriptHandler(
            handlerName: 'handlerFooWithArgs',
            callback: (args) {
              Widget okButton = TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
              /*AlertDialog alert = AlertDialog(
                title: Text("Simple Alert"),
                content: Text("This is an alert message."),
                actions: [
                  okButton,
                ],
              );*/
              Navigator.of(context).pushNamed("/app");
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ;//alert;
                },
              );
              print(args);
              // it will print: [1, true, [bar, 5], {foo: baz}, {bar: bar_value, baz: baz_value}]
            });
      },
    );
  }
}
// }
//        <script>
//             window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
//                  
//                     window.flutter_inappwebview
//                       .callHandler('handlerFooWithArgs', 1, true, ['bar', 5], {foo: 'baz'}, result);
//                 });
//             });
//         </script>
