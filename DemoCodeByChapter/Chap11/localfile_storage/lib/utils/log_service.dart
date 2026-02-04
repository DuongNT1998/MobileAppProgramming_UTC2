import 'dart:io';
import 'file_utils.dart';

class LogService {

  /// Ghi log vào file
  static Future<void> writeLog(String message) async {

    File logFile = await FileUtils.getLogFile();

    DateTime now = DateTime.now();
    String timeStamp = now.toIso8601String();

    String logLine = timeStamp + ' - ' + message + '\n';

    await logFile.writeAsString(
      logLine,
      mode: FileMode.append,
      flush: true,
    );
  }

  /// Đọc toàn bộ log
  static Future<String> readLogs() async {

    File logFile = await FileUtils.getLogFile();

    bool fileExists = await logFile.exists();

    if (fileExists == false) {
      return 'No logs yet.';
    }

    String content = await logFile.readAsString();

    return content;
  }
}
