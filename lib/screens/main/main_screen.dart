import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/screens/main/components/caro3.dart';
import 'package:news/screens/main/components/icons.dart';
import 'package:news/screens/main/components/web_menu.dart';
import '../../constants.dart';
import '../../responsive.dart';

class MainScreen extends StatelessWidget {

  static const colorizeColors = [
    Color.fromRGBO(0, 0, 0, 1),
    Color.fromRGBO(255, 0, 0, 1),

  ];
  List itemColors = [Colors.green, Colors.purple, Colors.blue];

  static const colorizeTextStyle = TextStyle(
    fontSize: 70.0,
    fontFamily: 'Horizon',
  );
  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: Drawer(
        child: Container(
          color: kDarkBlackColor,
          child: Obx(()=>
              ListView(
                children: [
                  DrawerHeader(child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 70 ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/sider.png'),

                          )
                      ),
                    ),
                  ) ),
                  ...List.generate(_controller.menuItems.length,
                          (index) => (DrawerItem(index:index,title: _controller.menuItems[index], isActive: _controller.selectedIndex==index, press:(){_controller.setMenuIndex(index);})))

                ],
              ),
          )
        )
      ),
      body:SingleChildScrollView(
        child:  Column(
         children: [
           Stack(
             children: [
               Container(height: 900),
               Row(
                 children: [

                   Container(
                     decoration: BoxDecoration(
                       border: Border.all(width: 0, color: Colors.black),
                       color: Colors.white,
                     ),
                     width: MediaQuery.of(context).size.width,
                     height:MediaQuery.of(context).size.height ,
                     child: Carousel3(),

                   ),

                 ],
               ),
               Column(
                 children: [
                   Container(
                     height: MediaQuery.of(context).size.height,
                     decoration: BoxDecoration(
                         image: DecorationImage(
                             image: AssetImage('assets/sider.png'),
                             opacity: 0.2
                         )

                     ),
                     width: double.infinity,
                     child: SafeArea(
                       child: Column(
                         children: [
                           Container(
                               padding:  EdgeInsets.all(kDefaultPadding),
                               constraints: BoxConstraints(maxWidth: kMaxWidth),
                               child: Column(
                                 children: [
                                   Container(

                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: kDarkBlackColor,

                                     ),

                                     child: Row(
                                       children: [
                                         if (!Responsive.isDesktop(context))
                                           IconButton(onPressed: (){_controller.openOrCloseDrawer();}, icon: Icon(Icons.menu,color: Colors.white,)),
                                         MouseRegion(
                                           cursor: SystemMouseCursors.click,
                                           child: GestureDetector(
                                             child: Container(
                                               width: 70,
                                               height: 70,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10),
                                                   image: const DecorationImage(
                                                       fit: BoxFit.cover,
                                                       image: AssetImage('assets/sider.png')
                                                   )
                                               ),
                                             ),
                                             onTap: () {},
                                           ),
                                         ),

                                         Container(
                                           child: Column(
                                             children: [
                                               Text("Complex Sidergique",style: TextStyle(color: Colors.white),),
                                               Gap(10),
                                               Text("SIDER EL HADJAR",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),),
                                             ],
                                           ),
                                         ),

                                         Spacer(),
                                         if (Responsive.isDesktop(context)) WebMenu(),
                                         Spacer(),
                                         IconsSocial(),
                                         Gap(20),
                                         ElevatedButton(onPressed: (){}, child: Text("Contact Us")),
                                         Gap(10),

                                       ],
                                     ),
                                   ),

                                   Gap(40),

                                   Container(
                                     child: Column(
                                       children: [

                                         if (!Responsive.isMobile(context)) SizedBox(
                                             width: MediaQuery.of(context).size.width,
                                             height:MediaQuery.of(context).size.height*0.7 ,

                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.end,
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Text("SYMBOL",style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1),fontWeight: FontWeight.bold,fontSize: 50),),
                                                 Container(
                                                   width: 150,
                                                   height: 3,
                                                   color: Colors.red,




                                                 ),
                                                 Container(

                                                   padding: EdgeInsets.all(15),
                                                   decoration: BoxDecoration(
                                                     color: Color.fromRGBO(0, 0, 0,0.5),
                                                     borderRadius: BorderRadius.only(
                                                         topLeft: Radius.circular(30),
                                                         topRight: Radius.circular(0),
                                                         bottomLeft: Radius.circular(30),
                                                         bottomRight: Radius.circular(0)
                                                     ),
                                                     boxShadow: [
                                                       BoxShadow(
                                                         color: Colors.grey.withOpacity(0.5),
                                                         spreadRadius: 5,
                                                         blurRadius: 7,
                                                         offset: Offset(0, 3), // changes position of shadow
                                                       ),
                                                     ],

                                                   ),
                                                   child: Text("de l'industrie lourde",style: TextStyle(color: Colors.white,fontSize: 35),) ,
                                                 ),

                                               ],
                                             )


                                         ),
                                       ],
                                     ),
                                   ),



                                 ],
                               )



                           ),

                         ],
                       ),
                     ),
                   ),

                 ],
               ),



             ],
           ),
         ]
        )
      )

    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;
  final int index;
  const DrawerItem({Key? key, required this.title,required this.isActive,required this.press, required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   if (index !=0) return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      onTap: press,
      selected: isActive,
      selectedTileColor: kPrimaryColor,
      title: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    );
   else return ExpansionTile(
     title: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
     leading: Icon(Icons.home),
     collapsedIconColor: Colors.grey,
     iconColor: Colors.red,
     childrenPadding: EdgeInsets.only(left:60), //children padding
     children: [
       ListTile(
         title: Text("Child Category 1",style: TextStyle(color: Colors.white),),
         onTap: press,
         selected: isActive,
         selectedTileColor: kPrimaryColor,
       ),

       ListTile(
         title: Text("Child Category 2",style: TextStyle(color: Colors.white)),

         onTap: press,
         selected: isActive,
         selectedTileColor: kPrimaryColor,
       ),

       //more child menu
     ],
   );
  }
}

