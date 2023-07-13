import 'package:flutter/material.dart';

class FertilizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fertilizer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fertilizer Screen',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Call a function to get fertilizer data
                _getFertilizerData();
              },
              child: Text('Get Fertilizer Data'),
            ),
          ],
        ),
      ),
    );
  }

  void _getFertilizerData() {
    // Function to fetch fertilizer data
    // Implement your logic here
    print('Fetching fertilizer data...');

    // Simulated fertilizer data
    List<Fertilizer> fertilizers = [
      Fertilizer('Urea', 'Nitrogen', 'N'),
      Fertilizer('DAP', 'Phosphorus', 'P'),
      Fertilizer('MOP', 'Potassium', 'K'),
      Fertilizer('SSP', 'Phosphorus', 'P'),
      Fertilizer('Ammonium Sulfate', 'Nitrogen', 'N'),
      Fertilizer('Potassium Nitrate', 'Potassium and Nitrogen', 'K, N'),
    ];

    // Display fertilizer data
    for (var fertilizer in fertilizers) {
      print('Name: ${fertilizer.name}');
      print('Nutrient: ${fertilizer.nutrient}');
      print('Symbol: ${fertilizer.symbol}');
      print('----------------------');
    }
  }
}

class Fertilizer {
  final String name;
  final String nutrient;
  final String symbol;

  Fertilizer(this.name, this.nutrient, this.symbol);
}
