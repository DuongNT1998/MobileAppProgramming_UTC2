import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'file_utils.dart';

class ImageStorageService {

  /// Download image từ URL và lưu vào local
  static Future<File?> downloadAndSaveImage(
      String imageUrl,
      String fileName,
      ) async {

    try {

      Uri uri = Uri.parse(imageUrl);

      http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        return null;
      }

      Uint8List imageBytes = response.bodyBytes;

      File imageFile = await _getLocalImageFile(fileName);

      await imageFile.writeAsBytes(
        imageBytes,
        flush: true,
      );

      return imageFile;

    } catch (error) {
      return null;
    }
  }

  /// Lấy file image từ local
  static Future<File?> getLocalImage(String fileName) async {

    File imageFile = await _getLocalImageFile(fileName);

    bool exists = await imageFile.exists();

    if (exists == false) {
      return null;
    }

    return imageFile;
  }

  /// Private: tạo đường dẫn file image
  static Future<File> _getLocalImageFile(String fileName) async {

    Directory directory = await FileUtils.getAppDirectory();

    String imageDirPath = directory.path + '/images';

    Directory imageDirectory = Directory(imageDirPath);

    bool dirExists = await imageDirectory.exists();

    if (dirExists == false) {
      await imageDirectory.create(recursive: true);
    }

    String filePath = imageDirectory.path + '/' + fileName;

    File imageFile = File(filePath);

    return imageFile;
  }
}
