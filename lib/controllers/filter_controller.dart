

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class  FilterController  extends GetxController {


  var rangeSlider = RangeValues(400, 1000).obs;
  var rooms = "any".obs;
  var bathroom = "any".obs;


  changeSlider(RangeValues range){
    rangeSlider.value = range;
  }

  changeRoom(String  title){
    rooms.value = title;
  }
  changeBath(String  title){
    bathroom.value = title;
  }
}