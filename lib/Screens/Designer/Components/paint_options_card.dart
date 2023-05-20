import 'package:flutter/material.dart';
import 'package:fyp/Screens/Designer/design_options.dart';
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
              value: designObj.selectedVendor,
              items: designObj.dropDownVendorItems,
              onChanged: (value) {
                setState(() {
                  designObj.selectedVendor = value as String;
                  designObj.paintShadeList = [];
                  List<PaintTO>? vendorPaintList = designObj.paintMap[designObj.selectedVendor];
                  for (int i = 0; i <  vendorPaintList!.length; i++) {
                    designObj.paintShadeList.add(vendorPaintList[i].code);
                  }
                });
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < designObj.paintShadeList.length; i++)
                  PaintShade(paintCode: designObj.paintShadeList[i], onTap: widget.onTap)
              ],
            )
          ],
        ),
      ),
    );
  }
}