
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_state_app_flutter/models/property.dart';
import 'package:real_state_app_flutter/views/detail_screen.dart';
import 'package:real_state_app_flutter/views/home/filter.dart';

Widget  textFieldComponent(){

  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child:TextField(
      style: TextStyle(
        height: 1,
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(
          fontSize: 28,
          color: Colors.grey[400]
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
      ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.search,color: Colors.grey[400],size: 28,),

        )

      ),
    ) ,

  );
}


Widget categoryComponent (BuildContext context){
  return Padding(
    padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
    child:

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 32,

            child: Stack(
              children: [
                ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 30,),
                    buildFilter("House"),
                    buildFilter("Price"),
                    buildFilter("Security"),
                    buildFilter("Bedrooms"),
                    buildFilter("Garage"),
                    buildFilter("Swimming Pool"),
                    SizedBox(width: 10,),

                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 28,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                            ]

                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            _showButtomSheet(context);
          },
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text("Filters"),
          ),
        )
      ],
    ),
  );
}

Widget resultComponent(){
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Text("50",style: TextStyle(fontSize: 18),),
        SizedBox(width: 5,),
        Text("Results found",style: TextStyle(fontSize: 18),),

      ],
    ),
  );
}
Widget buildFilter(String name){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey,width: 1),
      borderRadius: BorderRadius.circular(10)
    ),
   child: Center(
     child: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
   ),    
  );
}



Widget properiesComponent(List<Property> props){
  return Expanded(child: Container(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
     // children: buildProperties(props) ,
      children: props.map((x)=>buildProperty(x)).toList() ,
    ),
  ));
}

Widget buildProperty(Property prop){
  return Hero(tag: prop.frontImage,

      child:
  GestureDetector(
    onTap: (){
      Get.to(DetailScreen(prop));
    },
    child: Card(
      margin: EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(prop.frontImage),
            fit: BoxFit.cover

          )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(

              gradient: LinearGradient(

                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7)
                ]
              ),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin: EdgeInsets.only(top: 10),
              width: 70,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                color: prop.label=="RENT"?Colors.yellow[700]:Colors.green[700]
              ),
              child: Center(child: Text(prop.label,style: TextStyle(color: Colors.white),),),
            ),
            Expanded(child: Container(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${prop.name}",style: TextStyle(fontSize: 15,color: Colors.white),),
                Text("\$\ ${prop.price}",style: TextStyle(fontSize: 15,color: Colors.white),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    Icon(Icons.location_on,color: Colors.white, size: 13,),
                    SizedBox(width: 2,),
                    Text(" ${prop.location}",style: TextStyle(fontSize: 13,color: Colors.white),),
                    SizedBox(width: 2,),
                    Icon(Icons.zoom_out_map,color: Colors.white, size: 13,),
                    SizedBox(width: 2,),
                    Text(" ${prop.sqm} sq/m",style: TextStyle(fontSize: 13,color: Colors.white),),

                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.star,color: Colors.white, size: 13,),
                    SizedBox(width: 2,),
                    Text(" ${prop.review} review",style: TextStyle(fontSize: 13,color: Colors.white),),

                  ],
                ),

              ],
            )

          ],
          ),
        ),
      ),
    ),
  )
  );
}
void _showButtomSheet(BuildContext context){

  showModalBottomSheet(context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      builder:(BuildContext context){

    return Wrap(
      children: [Filter()],
    );
      });
  
  
}