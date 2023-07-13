// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class GoogleNewsScreen extends StatefulWidget {
//   @override
//   _GoogleNewsScreenState createState() => _GoogleNewsScreenState();
// }
//
// class _GoogleNewsScreenState extends State<GoogleNewsScreen> {
//   late WebViewController _webViewController;
//   late TextEditingController _searchController;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//   }
//
//   void _loadUrl(String url) {
//     _webViewController.loadUrl(url);
//   }
//
//   void _searchNews(String query) {
//     String url = 'https://news.google.com/search?q=$query';
//     _loadUrl(url);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google News'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: Text('Search News'),
//                     content: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         hintText: 'Enter a search query',
//                       ),
//                     ),
//                     actions: [
//                       TextButton(
//                         child: Text('Search'),
//                         onPressed: () {
//                           String query = _searchController.text.trim();
//                           if (query.isNotEmpty) {
//                             _searchNews(query);
//                           }
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: WebView(
//         initialUrl: 'https://news.google.com/',
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (controller) {
//           _webViewController = controller;
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = '6136204c3bf74f7d978a4c72f73d21d0';
  late TextEditingController _searchController;
  List<dynamic> articles = [];
  String selectedLanguage = 'en'; // 'hi' for Hindi, 'mr' for Marathi

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchNews();
  }

  Future<void> fetchNews() async {
    String url = 'https://newsapi.org/v2/top-headlines?apiKey=$apiKey&language=$selectedLanguage';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        articles = jsonData['articles'];
      });
    }
  }

  Future<void> searchNews(String query) async {
    String url =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey&language=$selectedLanguage';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        articles = jsonData['articles'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search news',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  searchNews(value);
                }
              },
            ),
          ),
          DropdownButton<String>(
            value: selectedLanguage,
            items: [
              DropdownMenuItem(
                value: 'hi',
                child: Text('Hindi'),
              ),
              DropdownMenuItem(
                value: 'mr',
                child: Text('Marathi'),
              ),DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedLanguage = value!;
              });
              if (_searchController.text.isNotEmpty) {
                searchNews(_searchController.text);
              } else {
                fetchNews();
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                var article = articles[index];
                return ListTile(
                  title: Text(article['title']),
                  subtitle: Text(article['source']['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(article),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewsDetails extends StatelessWidget {
  final Map article;

  NewsDetails(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
      ),
      body: WebView(
        initialUrl: article['url'],
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'News App',
      home: NewsScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

