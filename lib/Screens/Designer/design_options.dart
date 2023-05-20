import 'dart:io';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';
import '../../data_retreive.dart';

Design designObj = Design.instance;

class Design{
  Design._privateConstructor();
  static final Design _obj = Design._privateConstructor();
  static Design get instance => _obj;
  HashMap<String, List<PaintTO>> paintMap = HashMap();
  HashMap<String, List<String>> imageMap = HashMap();
  String selectedVendor = 'Master Paints';
  List<String> paintShadeList = [];
  String selectedShade = '';
  List<DropdownMenuItem> dropDownVendorItems = [];
  DataRetrieval data = DataRetrieval();
  late double touchX;
  late double touchY;

  void getXY(double longitude,double latitude, File image){
    final size = ImageSizeGetter.getSize(FileInput(image));
    final width = size.width;
    final height = size.height;
    double x = ((longitude + 180) / 360) * width;
    double y = ((1 - (latitude + 90) / 180)) * height;
    debugPrint('$x  $y');
    touchX = x;
    touchY = y;
  }

  void populateVendorsAndPaints() {
    paintMap.forEach((key, value) {
      DropdownMenuItem item = DropdownMenuItem(value: key, child: Text(key));
      dropDownVendorItems.add(item);
      }
    );
    for (int i = 0; i < paintMap['Master Paints']!.length; i++) {
      paintShadeList.add(paintMap['Master Paints']![i].code);
    }
  }


  void populateHashMap() async {
    paintMap = await data.getPaintsandVendors();
    populateVendorsAndPaints();
    imageMap = await data.getFurnitureImages();

  }
  void start(){
    populateHashMap();
  }
}


class PaintTO {
  late String name;
  late String code;
  PaintTO(String n, String c) {
    name = n;
    code = c;
  }
}





