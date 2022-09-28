import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel3 extends StatefulWidget {

  const Carousel3({Key? key}) : super(key: key);


  @override
  State<Carousel3> createState() => _Carousel3State();
}

class _Carousel3State extends State<Carousel3> {
  var autoplay=false;
      Future<void> change() async {
    await Future.delayed(const Duration(milliseconds: 800), (){
      setState(() {
        autoplay=true;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
        change();
    return Scaffold(
      body: ListView(
          children: [
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/usin3.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/usin4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                reverse: true,
                autoPlay: autoplay,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayInterval: Duration(milliseconds: 5000),
                viewportFraction: 1,
              ),
            ),
          ]),
    );;
  }
}
