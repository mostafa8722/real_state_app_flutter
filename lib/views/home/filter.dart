
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_state_app_flutter/controllers/filter_controller.dart';

class Filter extends StatelessWidget {


  FilterController controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

     Obx((){
       return  Container(
         padding: EdgeInsets.all(10),
         child:
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Text("Filter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                 SizedBox(width: 4,),
                 Text(" your search",style: TextStyle(fontSize: 20),),
               ],
             ),
             SizedBox(height: 30,),
             Row(
               children: [
                 Text("price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                 SizedBox(width: 4,),
                 Text(" range",style: TextStyle(fontSize: 20),),
               ],
             ),

             RangeSlider(values: controller.rangeSlider.value, onChanged: (RangeValues range){

               controller.changeSlider(range);
               print(range);
             },
               min: 70,
               max: 1000,
               activeColor: Colors.blue[900],
               inactiveColor: Colors.grey[300],

             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("70k",style: TextStyle(fontSize: 14),),
                 SizedBox(width: 4,),
                 Text(" 1000k",style: TextStyle(fontSize: 14),),
               ],
             ),
             SizedBox(height: 10,),
             Text("Rooms",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
             SizedBox(height: 10,),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                GestureDetector(
                  onTap: (){
                    controller.changeRoom("any");
                  },
                  child:  buildOption("any",controller.rooms=="any"?true:false),
                ),
                 GestureDetector(
                   onTap: (){
                     controller.changeRoom("1");
                   },
                   child:  buildOption("1",controller.rooms=="1"?true:false),
                 ),
                 GestureDetector(
                   onTap: (){
                     controller.changeRoom("2");
                   },
                   child:  buildOption("2",controller.rooms=="2"?true:false),
                 ),
                 GestureDetector(
                   onTap: (){
                     controller.changeRoom("+3");
                   },
                   child:  buildOption("+3",controller.rooms=="+3"?true:false),
                 ),


               ],
             ),
             SizedBox(height: 10,),
             Text("Bathrooms",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                   onTap: (){
                     controller.changeBath("any");
                   },
                   child:  buildOption("any",controller.bathroom=="any"?true:false),
                 ),
                 GestureDetector(
                   onTap: (){
                     controller.changeBath("1");
                   },
                   child:  buildOption("1",controller.bathroom=="1"?true:false),
                 ),
                 GestureDetector(
                   onTap: (){
                     controller.changeBath("2");
                   },
                   child:  buildOption("2",controller.bathroom=="2"?true:false),
                 ),
                 GestureDetector(
                   onTap: (){
                     controller.changeBath("+3");
                   },
                   child:  buildOption("+3",controller.bathroom=="+3"?true:false),
                 ),


               ],
             ),

           ],
         ),
       );
     });
  }

  Widget buildOption(String name , bool isSelected){
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: isSelected?Colors.green[700]:Colors.grey[300],
        borderRadius: BorderRadius.circular(10)

      ),
      child: Center(
        child: Text(name,style: TextStyle(color: isSelected?Colors.white:Colors.black,fontSize: 14),),
      ),
    );
  }
}