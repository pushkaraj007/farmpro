// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class AgroNewsScreen extends StatelessWidget {
//   final List<NewsOptionData> newsOptions = [
//     NewsOptionData(
//       title: 'सामना',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.saamana.com/',
//     ),
//     NewsOptionData(
//       title: 'लोकसत्ता',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.loksatta.com/maharashtra/',
//     ),
//     NewsOptionData(
//       title: 'महाराष्ट्र टाईम्स',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://maharashtratimes.com/agriculture/articlelist/93931952.cms',
//     ),
//     NewsOptionData(
//       title: 'ॲग्रोवन',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.agrowon.com/',
//     ),
//     NewsOptionData(
//       title: 'पुढारी',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://pudhari.news/tag/agriculture',
//     ),
//     NewsOptionData(
//       title: 'दिव्य मराठी',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.loksatta.com/',
//     ),
//     NewsOptionData(
//       title: 'महाराष्ट्र न्यूज',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.loksatta.com/',
//     ),
//     NewsOptionData(
//       title: 'तरुण भारत',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.loksatta.com/',
//     ),
//     NewsOptionData(
//       title: 'लोकसत्ता',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.loksatta.com/',
//     ),
//     NewsOptionData(
//       title: 'लोकसत्ता',
//       icon: FontAwesomeIcons.newspaper,
//       url: 'https://www.loksatta.com/',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Agro News'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.green[400]!,
//               Colors.blue[500]!,
//             ],
//           ),
//         ),
//         child: GridView.count(
//           crossAxisCount: 2,
//           padding: EdgeInsets.all(16.0),
//           childAspectRatio: 1.2,
//           mainAxisSpacing: 20.0,
//           crossAxisSpacing: 20.0,
//           children: newsOptions.map((option) {
//             return NewsOption(
//               title: option.title,
//               icon: option.icon,
//               onTap: () {
//                 _openWebPage(context, option.url);
//               },
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
//
//   void _openWebPage(BuildContext context, String url) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => WebViewScreen(url: url),
//       ),
//     );
//   }
// }
//
// class NewsOption extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;
//
//   const NewsOption({
//     required this.title,
//     required this.icon,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 4.0,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 40.0,
//               color: Colors.black,
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NewsOptionData {
//   final String title;
//   final IconData icon;
//   final String url;
//
//   NewsOptionData({
//     required this.title,
//     required this.icon,
//     required this.url,
//   });
// }
//
// class WebViewScreen extends StatefulWidget {
//   final String url;
//
//   WebViewScreen({required this.url});
//
//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }
//
// class _WebViewScreenState extends State<WebViewScreen> {
//   late WebViewController _webViewController;
//   bool _isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Article'),
//       ),
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl: widget.url,
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (WebViewController webViewController) {
//               _webViewController = webViewController;
//             },
//             onPageFinished: (String url) {
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//           if (_isLoading)
//             Center(
//               child: CircularProgressIndicator(),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'News API',
              ),
              Tab(
                text: 'Google News',
              ),
            ],
            indicator: BoxDecoration(
              color: Colors.green,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.lightGreen,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
              children: [
                NewsScreen(),
                GoogleNewsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey = '6136204c3bf74f7d978a4c72f73d21d0';
  late TextEditingController _searchController;
  List<dynamic> articles = [];
  String selectedLanguage = 'en';
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchNews();
  }

  Future<void> fetchNews() async {
    String url = 'https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=6136204c3bf74f7d978a4c72f73d21d0';
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
  final Map<String, dynamic> article;

  NewsDetails(this.article);

  Future<void> _openInBrowser() async {
    if (await canLaunch(article['url'])) {
      await launch(article['url']);
    } else {
      throw 'Could not launch ${article['url']}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title']),
      ),
      body: Column(
        children: [
          Center( heightFactor: 15,
          child: ElevatedButton(
            onPressed: _openInBrowser,
            child: Text('Open in Browser'),
          ),
          ),
        ],
      ),
    );
  }
}

class GoogleNewsScreen extends StatefulWidget {
  @override
  _GoogleNewsScreenState createState() => _GoogleNewsScreenState();
}

class _GoogleNewsScreenState extends State<GoogleNewsScreen> {
  final String googleNewsUrl = 'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en';

  @override
  void initState() {
    super.initState();
    _openInBrowser();
  }

  Future<void> _openInBrowser() async {
    if (await canLaunch(googleNewsUrl)) {
      await launch(googleNewsUrl);
    } else {
      throw 'Could not launch $googleNewsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
