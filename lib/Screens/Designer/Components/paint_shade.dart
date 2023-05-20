import 'package:flutter/material.dart';
import 'package:fyp/Screens/Designer/design_options.dart';

class PaintShade extends StatefulWidget {
  const PaintShade({super.key, required this.paintCode, required this.onTap});
  final String paintCode;
  final VoidCallback onTap;

  @override
  State<PaintShade> createState() => _PaintShadeState();
}

class _PaintShadeState extends State<PaintShade> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap();
        designObj.selectedShade = widget.paintCode;
        },
      child: Column(
          children:[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Color(int.parse(widget.paintCode)),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ]
      ),
    );
  }
}