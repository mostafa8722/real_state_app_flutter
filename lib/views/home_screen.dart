

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_state_app_flutter/controllers/property_controller.dart';
import 'package:real_state_app_flutter/views/home/home_widgets.dart';

class HomeScreen extends StatelessWidget {


  PropertyController controller = Get.put(PropertyController());
  @override
  Widget build(BuildContext context) {
    controller.fetchProperty();
    return Scaffold(
     backgroundColor: Colors.white,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          textFieldComponent(),
          categoryComponent(context),
          resultComponent(),

          Obx((){
            return properiesComponent(controller.properties);
          })
        ],
      ),
    );
  }
}