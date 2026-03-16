// import 'package:flutter/material.dart';
// import 'package:college_project/models/user_models.dart';

// class WeightTrackerScreen extends StatefulWidget {
//   final User user;
//   const WeightTrackerScreen({super.key, required this.user});

//   @override
//   State<WeightTrackerScreen> createState() => _WeightTrackerScreenState();
// }

// class _WeightTrackerScreenState extends State<WeightTrackerScreen> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       appBar: AppBar(
//         title: const Text("Weight Tracker"),
//         centerTitle: true,
//         backgroundColor: Colors.blue.shade700,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // Current weight
//             Text(
//               "${widget.user.weight} kg",
//               style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text("Current Weight", style: TextStyle(fontSize: 16, color: Colors.black54)),
//             const SizedBox(height: 30),

//             // Add new weight field
//             TextField(
//               controller: _controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "Enter new weight",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             const SizedBox(height: 15),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 48),
//                 backgroundColor: Colors.blue.shade800,
//               ),
//               onPressed: () {
//                 if (_controller.text.isNotEmpty) {
//                   setState(() {
//                     widget.user.weight = int.parse(_controller.text);
//                   });
//                   _controller.clear();
//                 }
//               },
//               child: const Text("Update Weight", style: TextStyle(fontSize: 18)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
