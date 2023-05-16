import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';
import 'Components/paint_options_card.dart';
import 'image_options.dart';
import 'room_equipment_object.dart';
import 'draggable_equipment.dart';
import 'package:fyp/Screens/Designer/paint_options.dart';
import 'package:path_provider/path_provider.dart';

class DesignerScreen extends StatefulWidget {
  const DesignerScreen({Key? key}) : super(key: key);
  @override
  State<DesignerScreen> createState() => _DesignerScreenState();
}

class _DesignerScreenState extends State<DesignerScreen>
    with SingleTickerProviderStateMixin {
  bool _showDeleteButton = false;
  bool _isDeleteButtonActive = false;
  bool paintOptionsVisibility = false;
  List<Widget> addedEquipment = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  File? _image;
  String filePath = '';
  void processImage() async {
    if (_image != null) {
      String url = "http://192.168.0.104:5000/process_image";
      File sendFile = File(filePath);
      List<int> imageBytes = await sendFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      var response = await http.post(Uri.parse(url),
          body: jsonEncode(<String, dynamic>{
            'img': base64Image,
            'x': paintObj.touchX,
            'y': paintObj.touchY,
            'shade': paintObj.selectedShade,
          }),
          headers: {'Content-Type': 'application/json'});
      Uint8List processedImage =
          base64.decode(jsonDecode(response.body)['img']);
      Directory tempDir = await getApplicationDocumentsDirectory();
      String filePathTemp =
          '${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      debugPrint(filePathTemp);
      File imageFile = File(filePathTemp);
      await imageFile.writeAsBytes(processedImage);
      setState(() {
        filePath = filePathTemp;
        debugPrint('Done');
      });
    }
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/image.jpg');
      await file.writeAsBytes(bytes);
      setState(() {
        _image = file;
        filePath = file.path;
      });
    }
  }

  List<Widget> getRoomEquipment() {
    List<Widget> roomEquipment = [];
    for (int i = 1; i < 4; i++) {
      Widget image = RoomEquipmentObject(
        img: 'assets/Room Equipment/e $i.png',
        tapped: () {
          setState(() {
            addedEquipment.add(DraggableEquipment(
                key: Key(addedEquipment.length.toString()),
                onDragStart: () {
                  setState(() {
                    _showDeleteButton = true;
                  });
                },
                onDragEnd: (offset, key) {
                  setState(() {
                    _showDeleteButton = false;
                  });
                  if (offset.dy > (MediaQuery.of(context).size.height - 100)) {
                    addedEquipment.removeWhere((widget) => widget.key == key);
                  }
                },
                onDragUpdate: (offset, key) {
                  if (offset.dy > (MediaQuery.of(context).size.height - 100)) {
                    if (!_isDeleteButtonActive) {
                      setState(() {
                        _isDeleteButtonActive = true;
                      });
                    }
                  } else {
                    if (_isDeleteButtonActive) {
                      setState(() {
                        _isDeleteButtonActive = false;
                      });
                    }
                  }
                },
                child: Image(
                    image: AssetImage('assets/Room Equipment/e $i.png'))));
          });
        },
      );
      roomEquipment.add(image);
    }
    return roomEquipment;
  }

  bool start = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _key,
      drawer: Drawer(
        width: 200,
        // icon: IconThemeData(color: Colors.black)
        child: ListView(
          children: getRoomEquipment(),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: _image == null
                ? const Text('Upload Image')
                : Panorama(
                    onTap: (longitude, latitude, tilt) {
                      paintObj.getXY(longitude, latitude, _image!);
                      setState(() {
                        paintOptionsVisibility = !paintOptionsVisibility;
                      });
                    },
                    child: Image.file(File(filePath)),
                  ),
          ),
          IconButton(
              onPressed: () {
                _key.currentState?.openDrawer();
              },
              color: Colors.black,
              icon: const Icon(Icons.menu)),
          for (int i = 0; i < addedEquipment.length; i++) addedEquipment[i],
          if (_showDeleteButton)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Icon(
                  Icons.delete,
                  size: _isDeleteButtonActive ? 38 : 28,
                  color: _isDeleteButtonActive ? Colors.red : Colors.black,
                ),
              ),
            ),
          Center(
            child: Visibility(
              visible: paintOptionsVisibility,
              child: PaintOptionsCard(
                onTap: () {
                  setState(() {
                    paintOptionsVisibility = false;
                    debugPrint(paintObj.selectedShade);
                    processImage();
                  });
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ImageOptions(
        onGalleryPressed: () {
          getImage();
        },
        savePressed: () {},
        onSphereCapturePressed: () async {
          await LaunchApp.openApp(
            androidPackageName: 'com.google.android.street',
            openStore: false,
          );
        },
      ),
    );
  }
}
