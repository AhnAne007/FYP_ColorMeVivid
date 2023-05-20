import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Screens/Designer/design_options.dart';

class DataRetrieval {
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference company =
  FirebaseFirestore.instance.collection('companies');
  final companySnap =
  FirebaseFirestore.instance.collection('companies').snapshots();

  CollectionReference paintRef = FirebaseFirestore.instance
      .collection('companies')
      .doc()
      .collection('paints');
  final paintSnap = FirebaseFirestore.instance
      .collection('companies')
      .doc()
      .collection('paints')
      .snapshots();


  Future<HashMap<String, List<PaintTO>>> getPaintsandVendors() async {
    HashMap<String, List<PaintTO>> paintMap = HashMap();
    List<PaintTO> paintList = [];

    QuerySnapshot companiesSnapshot = await company.get();

    for (QueryDocumentSnapshot companyDoc in companiesSnapshot.docs) {
      CollectionReference paintsRef =
      company.doc(companyDoc.id).collection('paints');
      Map? data = companyDoc.data() as Map?;
      //print(data!['name']);
      paintList = [];
      QuerySnapshot paintsSnapshot = await paintsRef.get();
      for (QueryDocumentSnapshot paintDoc in paintsSnapshot.docs) {
        Map? data = paintDoc.data() as Map?;
        paintList.add(PaintTO(data!['name'], data!['code']));
      }
      paintMap[data!['name']] = paintList;
    }

    return paintMap;
  }


  Future<HashMap<String, List<String>>> getFurnitureImages() async {
    debugPrint('cameHERE');
    HashMap<String, List<String>> imageMap = HashMap();
    List<String> imageList = [];


    CollectionReference furnishing =
    FirebaseFirestore.instance.collection('furnishings');
    final companySnap =
    FirebaseFirestore.instance.collection('companies').snapshots();
    CollectionReference furnishingRef = FirebaseFirestore.instance
        .collection('furnishings')
        .doc()
        .collection('images');
    final furnishingSnap = FirebaseFirestore.instance
        .collection('furnishings')
        .doc()
        .collection('images')
        .snapshots();

    QuerySnapshot furnishingSnapshot = await furnishing.get();
    Directory tempDir = await getApplicationDocumentsDirectory();
    for (QueryDocumentSnapshot furnishingDoc in furnishingSnapshot.docs) {
      CollectionReference imagesRef =
      furnishing.doc(furnishingDoc.id).collection('images');
      Map? data = furnishingDoc.data() as Map?;
      //print(data!['name']);
      imageList = [];
      QuerySnapshot FurnishingSnapshot = await imagesRef.get();
      for (QueryDocumentSnapshot furnishDoc in FurnishingSnapshot.docs) {
        Map? data = furnishDoc.data() as Map?;
        Uint8List furnitureImage = base64.decode(data!['imageURL']);
        String filePathTemp =
            '${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';
        File imageFile = File(filePathTemp);
        await imageFile.writeAsBytes(furnitureImage);
        imageList.add(filePathTemp);

      }
      imageMap[data!['name']] = imageList;
    }

    return imageMap;
  }

  uploadImage(String imageFile) async {
    print(imageFile);
    await userCollection
        .doc(_auth.currentUser!.uid)
        .update({'savedimages': FieldValue.arrayUnion([imageFile])});
   debugPrint('Done Saving');
  }
}


