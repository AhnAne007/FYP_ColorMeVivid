import 'dart:io';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

Paint paintObj = Paint.instance;

class Paint{

  Paint._privateConstructor(){
    populateVendorsAndPaints();
  }
  static final Paint _obj = Paint._privateConstructor();
  static Paint get instance => _obj;
  HashMap<String, List<PaintTO>> paintMap = HashMap();
  String selectedVendor = 'Masters';
  List<String> paintShadeList = [];
  String selectedShade = '';
  List<DropdownMenuItem> dropDownVendorItems = [];

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
    List<String> vendors = ['Masters', 'Nippon', 'Diamond'];
    for (int i = 0; i < vendors.length; i++) {
      DropdownMenuItem item =
      DropdownMenuItem(value: vendors[i], child: Text(vendors[i]));
      dropDownVendorItems.add(item);
    }
    List<PaintTO> m = [];
    m.add(PaintTO('Paprika', '0xFFcc7e35'));
    m.add(PaintTO('Red', '0xFFdb1832'));
    m.add(PaintTO('Green', '0xFF18db38'));
    m.add(PaintTO('Blue', '0xFF0000FF'));
    m.add(PaintTO('Cyan', '0xFF00FFFF'));
    m.add(PaintTO('Purple', '0xFF800080'));
    m.add(PaintTO('Maroon', '0xFF800000'));
    m.add(PaintTO('Pink', '0xFFFFC0CB'));
    m.add(PaintTO('Magenta', '0xFFFF00FF'));

    List<PaintTO> n = [];
    n.add(PaintTO('Green', '0xFF18db38'));
    n.add(PaintTO('Paprika', '0xFFcc7e35'));
    n.add(PaintTO('Red', '0xFFdb1832'));

    List<PaintTO> d = [];
    d.add(PaintTO('Paprika', '0xFFcc7e35'));
    d.add(PaintTO('Green', '0xFF18db38'));
    d.add(PaintTO('Red', '0xFFdb1832'));

    final ent = {'Masters': m, 'Nippon': n, 'Diamond': d};
    paintMap.addEntries(ent.entries);
    for (int i = 0; i < m.length; i++) {
      paintShadeList.add(m[i].code);
    }
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





