import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class IconsSocial extends StatefulWidget {
  const IconsSocial({Key? key}) : super(key: key);

  @override
  State<IconsSocial> createState() => _IconsSocialState();
}

class _IconsSocialState extends State<IconsSocial> {
  bool _favoriteHover = false;
  bool _favoriteHover2 = false;
  bool _favoriteHover3 = false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        children: [
          MouseRegion(
            onExit: (e) {
              setState(() {
              _favoriteHover = false;
              });
              },
            onHover: (e) {
              setState(() {
                _favoriteHover = true;
              });
            },
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Icon(FontAwesomeIcons.facebook,color: (_favoriteHover==true ? Colors.blueAccent   : Colors.white),),
              onTap: () {},
            ),
          ),

          Gap(10),
          MouseRegion(
            onExit: (e) {
              setState(() {
                _favoriteHover2 = false;
              });
            },
            onHover: (e) {
              setState(() {
                _favoriteHover2 = true;
              });
            },
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Icon(FontAwesomeIcons.twitter,color: (_favoriteHover2==true ? Colors.blueAccent   : Colors.white)),
              onTap: () {},
            ),
          ),
          Gap(10),
          MouseRegion(
            onExit: (e) {
              setState(() {
                _favoriteHover3 = false;
              });
            },
            onHover: (e) {
              setState(() {
                _favoriteHover3 = true;
              });
            },
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Icon(FontAwesomeIcons.youtube,color: (_favoriteHover3==true ? Colors.blueAccent   : Colors.white)),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
