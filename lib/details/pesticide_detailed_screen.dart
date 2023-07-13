// import 'package:farmpro/screens/dashboard_screen.dart';
// import 'package:flutter/material.dart';
//
// class CropDetailsScreen extends StatelessWidget {
//   final String cropName;
//   final String imagePath;
//   final String cropInfo;
//
//   const CropDetailsScreen({
//     required this.cropName,
//     required this.imagePath,
//     required this.cropInfo,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(cropName),
//         actions: [
//           // IconButton(
//           //   icon: Icon(Icons.home),
//           //   onPressed: () {
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(
//           //         builder: (context) => DashboardScreen(),
//           //       ),
//           //     );
//           //   },
//           // ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(10, 1, 10, 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 imagePath,
//                 height: 280,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 cropName,
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 cropInfo,
//                 style: TextStyle(fontSize: 24),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
