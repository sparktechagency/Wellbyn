import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: TextColors.neutral900,
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body:Column(
       children: [
         Container(
           height: 200,
           decoration: BoxDecoration(
             border: Border.all(color: Colors.black26),
             borderRadius: BorderRadius.circular(10),
           ),
           child: Signature(
             controller: _controller,
             backgroundColor: Colors.white,
           ),
         ),
       ],
     )
    );

  }
}
