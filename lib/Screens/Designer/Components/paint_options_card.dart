import 'package:flutter/material.dart';
import 'package:fyp/Screens/Designer/paint_options.dart';
import 'paint_shade.dart';

class PaintOptionsCard extends StatefulWidget {
  final VoidCallback onTap;
  const PaintOptionsCard({super.key, required this.onTap});
  @override
  State<PaintOptionsCard> createState() => _PaintOptionsCardState();
}
class _PaintOptionsCardState extends State<PaintOptionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton(
              value: paintObj.selectedVendor,
              items: paintObj.dropDownVendorItems,
              onChanged: (value) {
                setState(() {
                  paintObj.selectedVendor = value as String;
                  paintObj.paintShadeList = [];
                  List<PaintTO>? vendorPaintList = paintObj.paintMap[paintObj.selectedVendor];
                  for (int i = 0; i <  vendorPaintList!.length; i++) {
                    paintObj.paintShadeList.add(vendorPaintList[i].code);
                  }
                });
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < paintObj.paintShadeList.length; i++)
                  PaintShade(paintCode: paintObj.paintShadeList[i], onTap: widget.onTap)
              ],
            )
          ],
        ),
      ),
    );
  }
}