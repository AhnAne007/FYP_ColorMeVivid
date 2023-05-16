import 'package:flutter/material.dart';

class RoomEquipmentObject extends StatelessWidget {
  final String img;
  final VoidCallback tapped;
  const RoomEquipmentObject(
      {super.key, required this.img, required this.tapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Image(
        image: AssetImage(img),
      ),
    );
  }
}