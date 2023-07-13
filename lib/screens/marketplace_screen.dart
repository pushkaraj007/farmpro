import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MarketplaceScreen(),
    );
  }
}

class MarketplaceScreen extends StatefulWidget {
  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> _marketplaceItems = [
    'Cotton',
    'Banana',
    'Wheat',
    'Potato',
    'Sweet Potato',
    'Onion',
    'Yam',
    'Carrot',
    'Radish',
    'Cabbage',
    'Brinjal',
    'Tomato',
  ];
  List<String> _filteredItems = [];

  Map<String, Map<String, String>> _cropUrls = {
    'Cotton': {
      'Tx_Commodity': '15',
      'Tx_CommodityHead': 'Cotton',
      'Tx_MarketHead': 'Yaval',

    },
    'Banana': {
      'Tx_Commodity': '19',
      'Tx_CommodityHead': 'Banana',
      'Tx_MarketHead': 'Yaval',

    },
    'Wheat': {
      'Tx_Commodity': '1',
      'Tx_CommodityHead': 'Wheat',
      'Tx_MarketHead': 'Yaval',

    },
    'Potato': {
      'Tx_Commodity': '24',
      'Tx_CommodityHead': 'Potato',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Sweet Potato': {
      'Tx_Commodity': '152',
      'Tx_CommodityHead': 'Sweet Potato',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Onion': {
      'Tx_Commodity': '23',
      'Tx_CommodityHead': 'Onion',
      'Tx_MarketHead': 'Jalgaon',
    },
    'Yam': {
      'Tx_Commodity': '52',
      'Tx_CommodityHead': 'Yam',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Carrot': {
      'Tx_Commodity': '53',
      'Tx_CommodityHead': 'Carrot',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Radish': {
      'Tx_Commodity': '54',
      'Tx_CommodityHead': 'Radish',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Cabbage': {
      'Tx_Commodity': '61',
      'Tx_CommodityHead': 'Cabbage',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Brinjal': {
      'Tx_Commodity': '67',
      'Tx_CommodityHead': 'Brinjal',
      'Tx_MarketHead': 'Jalgaon',

    },
    'Tomato': {
      'Tx_Commodity': '73',
      'Tx_CommodityHead': 'Tomato',
      'Tx_MarketHead': 'Jalgaon',

    },
  };

  @override
  void initState() {
    _filteredItems = _marketplaceItems;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
      _filteredItems = _marketplaceItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // Hex value: #FFFFFF (white)
              Color(0xFF86E591), // Hex value: #86E591 (green)
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBar(
                controller: _searchController,
                onChanged: _filterItems,
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ItemList(
                  items: _filteredItems,
                  launchUrl: _launchUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String item) async {
    String currentDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
    String url = 'https://agmarknet.gov.in/SearchCmmMkt.aspx?Tx_Commodity=${_cropUrls[item]!['Tx_Commodity']}&Tx_State=MH&Tx_District=7&Tx_Market=1445&DateFrom=01-Jul-2023&DateTo=08-Jul-2023&Fr_Date=01-Jul-2023&To_Date=08-Jul-2023&Tx_Trend=0&Tx_CommodityHead=${_cropUrls[item]!['Tx_CommodityHead']}&Tx_StateHead=Maharashtra&Tx_DistrictHead=Jalgaon&Tx_MarketHead=${_cropUrls[item]!['Tx_MarketHead']}&dt=$currentDate';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Could not open the webpage.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBar({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 9.0,
            offset: Offset(2, 6),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

          class ItemList extends StatelessWidget {
  final List<String> items;
  final Function(String) launchUrl;

  const ItemList({
    required this.items,
    required this.launchUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton.icon(
            onPressed: () => launchUrl(item),
            icon: Icon(Icons.shopping_cart),
            label: Text(
              item,
              style: TextStyle(fontSize: 18.0),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              side: BorderSide(
                color: Colors.black26,
                width: 1.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
