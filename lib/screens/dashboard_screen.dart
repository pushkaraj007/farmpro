import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmpro/details/feedback.dart';
import 'package:farmpro/details/new.dart';
import 'package:farmpro/details/profile.dart';
import 'package:farmpro/details/settings.dart';
import 'package:farmpro/details/translation.dart';
import 'package:farmpro/screens/fertilizer_screen.dart';
import 'package:farmpro/screens/weathermap.dart';
import 'package:farmpro/screens/pesticide_screen.dart';
import 'package:farmpro/screens/pesttt.dart';
import 'package:farmpro/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../details/help.dart';
import 'livediscussion.dart';
import 'agro_news_screen.dart';
import 'crop_disease_screen.dart';
import 'crop_info.dart';
import 'login_screen.dart';
import 'marketplace_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String userEmail; // Add the userEmail property
  DashboardScreen({required this.userEmail});
  List<String> plantImages = [
    'images/plant4.jpeg',
    'images/cotton.png',
    'images/maize.png',
    'images/plant2.jpeg',
    'images/plant3.jpeg',
    'images/banana.png',
    'images/mango.png',
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
      );
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    String firstPart = userEmail.split('@')[0];
    String capitalizedFirstPart = firstPart[0].toUpperCase() + firstPart.substring(1);
    String name = capitalizedFirstPart.split(' ')[0]; // Extract the first name
    name = name.replaceAll(RegExp(r'\d+$'), '');

    return WillPopScope(
      onWillPop: () async {
        // Show double back press to exit dialog
        bool shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit Application'),
            content: const Text('Are you sure you want to exit the application?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        );

        return shouldExit ?? false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Welcome to FarmPro\n$name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE9FFEB),
                  Color(0xFF87E392),

                ],
              ),
            ),
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              children: [
                Image.asset(
                  'images/FarmPro-logos_transparent.png',
                  height: 200.0,
                  width: 700.0,
                  fit: BoxFit.cover,
                ),
                // DrawerHeader(
                //   child: Text(
                //     'FarmPro',
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 24,
                //     ),
                //   ),
                // ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(fontSize: 19),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(fontSize: 19),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Feedback',
                    style: TextStyle(fontSize: 19),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackScreen()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Help',
                    style: TextStyle(fontSize: 19),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpScreen()),
                    );
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ),

      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF), // Hex value: #66FF33 (green)
                Color(0xFF86E591), // Hex value: #3366FF (blue)
              ],
            ),
            // image: DecorationImage(
            //   image: AssetImage('images/dash1.jpg'),
            //   fit: BoxFit.cover,
            // ),
          ),
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CarouselSlider.builder(
                itemCount: plantImages.length,
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 2.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                    onTap: () {
                      // Handle image tap
                      // You can replace the 'DestinationScreen' with the desired screen to navigate to
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CropInfoScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(plantImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 16.0,
                  children: [
                    DashboardOption(
                      title: 'Weather',
                      icon: Icons.cloud,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherApiScreen()),
                        );
                      },
                    ),
                    DashboardOption(
                      title: 'Crop Info',
                      icon: Icons.eco,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CropInfoScreen()),
                        );
                      },
                    ),
                    DashboardOption(
                      title: 'Marketplace',
                      icon: Icons.shopping_cart,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MarketplaceScreen()),
                        );
                      },
                    ),
                    DashboardOption(
                      title: 'Crop Disease',
                      icon: Icons.warning,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CropDiseaseScreen()),
                        );
                      },
                    ),
                    DashboardOption(
                      title: 'Pesticides',
                      icon: Icons.bug_report,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PesticideScreen()),
                        );
                      },
                    ),
                    DashboardOption(
                      title: 'Discussion',
                      icon: Icons.people,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: ()
                      {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiscussionForumScreen()),
                          );
                        };
                      }


                    ),
                    DashboardOption(
                      title: 'Fertilizer',
                      icon: Icons.water,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
    // Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => PostScreen()),
    // );
                          },
                    ),
                    DashboardOption(
                      title: 'Agronews',
                      icon: Icons.newspaper,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TabScreen()),
                        );
                      },
                    ),

                    DashboardOption(
                      title: 'Weather Map',
                      icon: Icons.radar_sharp,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherScreen()),
                        );
                      },
                    ),
                    DashboardOption(
                      title: 'Upload',
                      icon: Icons.bug_report,
                      color: Colors.green,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FertilizerScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final Color iconColor;

  const DashboardOption({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: iconColor,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
