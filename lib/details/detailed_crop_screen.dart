import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CropDetailsScreen extends StatelessWidget {
  final String cropName;
  final String imagePath;
  final String cropInfo;
  final String cropGrowth;
  final String cropUrl;

  const CropDetailsScreen({
    required this.cropName,
    required this.imagePath,
    required this.cropInfo,
    required this.cropGrowth,
    required this.cropUrl,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cropName),
        actions: const [
          // IconButton(
          //   icon: Icon(Icons.home),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => DashboardScreen(),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 280,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  cropName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: cropUrl),
                        ),
                      );
                    },
                    child: const Text('Open in WebView'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                cropInfo,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                cropGrowth,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
