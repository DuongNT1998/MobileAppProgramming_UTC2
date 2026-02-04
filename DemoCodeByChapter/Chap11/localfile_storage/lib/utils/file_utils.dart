import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {

  /// Lấy thư mục lưu trữ của ứng dụng
  static Future<Directory> getAppDirectory() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory;
  }

  /// Lấy file log (logs.txt)
  static Future<File> getLogFile() async {
    Directory directory = await getAppDirectory();

    String filePath = directory.path + '/logs.txt';

    File file = File(filePath);

    return file;
  }
}
