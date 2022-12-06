import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  final ValueChanged<int> ontap;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomItem(
            name: "Explore",
            icon: "assets/icon/search.png",
            isSelected: selectedIndex == 0 ? true : false,
            onClick: () {
              tapTest(0);
            },
          ),
          BottomItem(
            name: "History",
            icon: "assets/icon/history.png",
            isSelected: selectedIndex == 1 ? true : false,
            onClick: () {
              tapTest(1);
            },
          ),
          BottomItem(
            name: "Saved",
            icon: "assets/icon/love.png",
            isSelected: selectedIndex == 2 ? true : false,
            onClick: () {
              tapTest(2);
            },
          ),
          BottomItem(
            name: "Profile",
            icon: "assets/icon/user.png",
            isSelected: selectedIndex == 3 ? true : false,
            onClick: () {
              tapTest(3);
            },
          ),
        ],
      ),
    );
  }

  void tapTest(int index) {
    // log("$index");

    setState(() {
      widget.ontap(index);
      selectedIndex = index;
    });
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  final String name, icon;
  final bool isSelected;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 25,
            width: 25,
            color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).highlightColor,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).highlightColor,
            ),
          )
        ],
      ),
    );
  }
}
