import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebScreen(),
    );
  }
}

class WebScreen extends StatefulWidget {
  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  late String currentUrl;

  @override
  void initState() {
    super.initState();
    String baseUrl =
        'https://agmarknet.gov.in/SearchCmmMkt.aspx?Tx_Commodity=19&Tx_State=MH&Tx_District=7&Tx_Market=1445';
    String currentDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
    currentUrl =
    '$baseUrl&DateFrom=01-Jul-2023&DateTo=$currentDate&Fr_Date=01-Jul-2023&To_Date=$currentDate&Tx_Trend=0&Tx_CommodityHead=Banana&Tx_StateHead=Maharashtra&Tx_DistrictHead=Jalgaon&Tx_MarketHead=Yawal';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: WebView(
        initialUrl: currentUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
