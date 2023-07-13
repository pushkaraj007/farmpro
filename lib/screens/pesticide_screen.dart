import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesticide Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PesticideScreen(),
    );
  }
}

class Pesticide {
  final String name;
  final String description;
  final String buyLink;

  Pesticide({
    required this.name,
    required this.description,
    required this.buyLink,
  });
}

class PesticideScreen extends StatefulWidget {
  @override
  _PesticideScreenState createState() => _PesticideScreenState();
}

class _PesticideScreenState extends State<PesticideScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Pesticide> _pesticides = [
    Pesticide(
      name: 'Cotton',
      description: 'Pesticides used for Cotton are :- \nGlyphosate\nGlyphosate is an herbicide. It is applied to the leaves of plants to kill both broadleaf plants and grasses. The sodium salt form of glyphosate is used to regulate plant growth and ripen specific crops. ',
      buyLink: 'https://www.google.com/search?q=pesticides+for+cotton+plant&oq=pesticides+for+cotton+plant&aqs=chrome..69i57j33i10i160j33i22i29i30l7.10410j0j7&sourceid=chrome&ie=UTF-8',
    ),
    Pesticide(
      name: 'Banana',
      description: 'Pesticides used for Banana includes:\n\nBavistin DF: This product contains Carbendazim as the active ingredient and is used for the control of fungal diseases in various crops.',
      buyLink: 'https://www.google.com/search?q=banana+pesticides+price&sxsrf=APwXEdcQHl0QDlT3WFYsRg85I3mFOTUy_A%3A1687800543470&ei=38qZZPqhHMqX4-EPzuiN-A8&ved=0ahUKEwi6jeH-uuH_AhXKyzgGHU50A_8Q4dUDCA8&uact=5&oq=banana+pesticides+price&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIHCCEQoAEQCjIHCCEQoAEQCjIHCCEQoAEQCjIHCCEQoAEQCjIHCCEQoAEQCjoKCAAQRxDWBBCwAzoHCCMQigUQJzoECCMQJzoICAAQigUQkQI6DQguEIoFEMcBENEDEEM6BwgAEIoFEEM6CAgAEIAEELEDOgsIABCABBCxAxCDAToTCC4QigUQsQMQgwEQxwEQ0QMQQzoHCC4QigUQQzoKCC4QigUQ1AIQQzoKCAAQigUQyQMQQzoICAAQigUQkgM6CwgAEIoFEJIDEIsDOgsIABCKBRCRAhCLAzoQCAAQigUQsQMQgwEQQxCLAzoNCC4Q1AIQsQMQigUQQzoFCAAQgAQ6CAguELEDEIAEOhEILhCDARCvARDHARCxAxCABDoJCC4QigUQChBDOgUILhCABDoLCC4QgAQQxwEQrwE6DQguEIMBELEDEIoFEEM6DQguEIoFELEDEIMBEEM6CwguEIAEELEDEIMBOgoIABCABBAUEIcCOgYIABAWEB46CAgAEBYQHhAPOggIABCKBRCGA0oECEEYAFCME1iDSGCUSWgFcAF4AIABlwKIAcwekgEGMC4xLjE2mAEAoAEBuAECwAEByAEI&sclient=gws-wiz-serp',
    ),
    Pesticide(
      name: 'Wheat',
      description: 'Pendimethalin :- Pendimethalin is an herbicide of the dinitroaniline class used in premergence and postemergence applications to control annual grasses and certain broadleaf weeds. It inhibits cell division and cell elongation.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Potato',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Corn',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Tomato',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Wheat',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Urid',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Moong',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Tur',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Papaya',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Soyabean',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Groundnut',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Harbara',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Bajra',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Dadar',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Jowar',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Turmeric',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Onion',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    Pesticide(
      name: 'Potato',
      description: 'This is the description of Banana.',
      buyLink: 'https://example.com/buy_pesticide_2',
    ),
    // Add more pesticides...
  ];
  List<Pesticide> _filteredPesticides = [];

  @override
  void initState() {
    _filteredPesticides = _pesticides;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPesticides(String query) {
    setState(() {
      _searchQuery = query;
      _filteredPesticides = _pesticides
          .where((pesticide) => pesticide.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _openPesticideDetails(Pesticide pesticide) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PesticideDetailsScreen(pesticide: pesticide),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesticide Marketplace'),
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
                onChanged: _filterPesticides,
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: PesticideList(
                  pesticides: _filteredPesticides,
                  onTap: _openPesticideDetails,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBar({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
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

class PesticideList extends StatelessWidget {
  final List<Pesticide> pesticides;
  final Function(Pesticide) onTap;

  const PesticideList({
    Key? key,
    required this.pesticides,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pesticides.length,
      itemBuilder: (context, index) {
        final pesticide = pesticides[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              onTap(pesticide);
            },
            icon: Icon(Icons.shopping_cart),
            label: Text(
              pesticide.name,
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

class PesticideDetailsScreen extends StatelessWidget {
  final Pesticide pesticide;

  const PesticideDetailsScreen({Key? key, required this.pesticide}) : super(key: key);

  void _launchURL() async {
    if (await canLaunch(pesticide.buyLink)) {
      await launch(pesticide.buyLink);
    } else {
      print('Could not launch ${pesticide.buyLink}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesticide Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              pesticide.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              pesticide.description,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }
}
