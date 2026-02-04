import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/image_storage_service.dart';
import '../widgets/image_action_button.dart';

class ImageView extends StatefulWidget {

  @override
  State<ImageView> createState() {
    return _ImageViewState();
  }
}

class _ImageViewState extends State<ImageView> {

  File? localImageFile;

  final String imageUrl = 'https://gamestop.vn/wp-content/uploads/2025/07/char-pikachu-1.png';
  final String fileName = 'sample_image.png';

  Future<void> downloadImage() async {

    File? imageFile =
    await ImageStorageService.downloadAndSaveImage(
      imageUrl,
      fileName,
    );

    setState(() {
      localImageFile = imageFile;
    });
  }

  Future<void> loadLocalImage() async {

    File? imageFile =
    await ImageStorageService.getLocalImage(fileName);

    setState(() {
      localImageFile = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Downloaded Image Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            ImageActionButton(
              title: 'Download Image',
              onPressed: downloadImage,
            ),

            SizedBox(height: 12),

            ImageActionButton(
              title: 'Load Local Image',
              onPressed: loadLocalImage,
            ),

            SizedBox(height: 20),

            Expanded(
              child: Center(
                child: localImageFile == null
                    ? Text('No image available')
                    : Image.file(localImageFile!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
