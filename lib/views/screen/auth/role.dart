import 'package:flutter/material.dart';
import 'package:wellbyn/views/screen/auth/widgets/role_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoleSelectionPage(),
    );
  }
}

// class RoleSelectionPage extends StatefulWidget {
//   @override
//   _RoleSelectionPageState createState() => _RoleSelectionPageState();
// }
//
// class _RoleSelectionPageState extends State<RoleSelectionPage> {
//   String selectedRole = 'Patients';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 60),
//
//               const SizedBox(height: 16),
//               Text("Wellbyn", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue)),
//               const SizedBox(height: 40),
//               Text("Welcome to Wellbyn", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
//               const SizedBox(height: 30),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Chose your role", style: TextStyle(fontSize: 16)),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor:
//                         selectedRole == 'Patients' ? HexColor("#f2f8fd") : Colors.white,
//                         side: BorderSide(
//                           color: selectedRole == 'Patients'
//                               ? HexColor("#2E8BC9") // Selected border color
//                               : Colors.grey,         // Unselected border color
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           selectedRole = 'Patients';
//                         });
//                       },
//                       child: Text(
//                         "Patients",
//                         style: TextStyle(
//                           color: selectedRole == 'Patients'
//                               ? HexColor("#2E8BC9") // Selected text color
//                               : Colors.grey,        // Unselected text color
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor:
//                         selectedRole == 'Doctor' ? HexColor("#f2f8fd") : Colors.white,
//                         side: BorderSide(
//                           color: selectedRole == 'Doctor'
//                               ? HexColor("#2E8BC9")
//                               : Colors.grey,
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           selectedRole = 'Doctor';
//                         });
//                       },
//                       child: Text(
//                         "Doctor",
//                         style: TextStyle(
//                           color: selectedRole == 'Doctor'
//                               ? HexColor("#2E8BC9")
//                               : Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 30),
//               AppButton(text: "Next", onPressed: (){
//
//               }),
//               SizedBox(height: 20.h,),
//               GestureDetector(
//                 onTap: () {
//                   // Handle login link tap
//                   print('Log In tapped');
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 20),
//                   child: Text.rich(
//                     TextSpan(
//                       text: "Already have an account? ",
//                       children: [
//                         TextSpan(
//                           text: "Log In",
//                           style: TextStyle(color: Colors.blue),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
