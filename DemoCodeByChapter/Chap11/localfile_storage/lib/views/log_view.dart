import 'package:flutter/material.dart';
import '../utils/log_service.dart';
import '../widgets/log_button.dart';

class LogView extends StatefulWidget {

  @override
  State<LogView> createState() {
    return _LogViewState();
  }
}

class _LogViewState extends State<LogView> {

  String logContent = '';

  Future<void> addLog() async {

    await LogService.writeLog('User clicked ADD LOG button');

    await loadLogs();
  }

  Future<void> loadLogs() async {

    String logs = await LogService.readLogs();

    setState(() {
      logContent = logs;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLogs();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Local File Log Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            LogButton(
              title: 'Add Log',
              onPressed: addLog,
            ),

            SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  logContent,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
