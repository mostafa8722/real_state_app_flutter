
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_state_app_flutter/models/property.dart';

class DetailScreen extends StatelessWidget{

  final Property property;
  DetailScreen (@required this.property);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
         children: [
           Hero(
             tag: property.frontImage,
             child: Container(
              height: height*0.5,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage(property.frontImage),
                   fit: BoxFit.cover
                 )
               ),
               child: Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [
                       Colors.transparent,
                        Colors.grey
                     ],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter
                   )
                 ),
               ),
             ),

           ),
           Container(
             height: height*0.35,
             child: ,
           )
         ],
        ),
      ),
    );
