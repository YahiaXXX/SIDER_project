import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';

import '../../../constants.dart';

class WebMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) => WebMenuItem(
            index:index,
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: () => _controller.setMenuIndex(index),
          ),
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {


  const WebMenuItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.press,
    required this.index,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;
  final int index;

  @override
  _WebMenuItemState createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;
  int _value = 0;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    } else if (!widget.isActive & _isHover) {
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
  }
  List<ListItem> _dropdownItems = [
    ListItem(1, "Accueil"),
    ListItem(2, "Recrutement"),
    ListItem(3, "Actualités"),
    ListItem(4, "A Propos nous")
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _itemSelected;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _itemSelected = _dropdownMenuItems[1].value!;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child:

             Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
  return InkWell(

      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _borderColor(), width: 3),
          ),
        ),
        child:(widget.index==0
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: kDarkBlackColor,

          ),
          child:DropdownButtonHideUnderline(
            child:  DropdownButton(
                dropdownColor: Color.fromRGBO(0, 0, 0, 0.6),
                style: TextStyle(color: Colors.white),
                value: _itemSelected,
                items: _dropdownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _itemSelected = value as ListItem;
                  });
                }),
          )
        )
          : Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        )  )
      ),
    );

  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
