import 'package:flutter/material.dart';
import 'package:cliply_app/features/clipboard/data/datasources/accessibility_local_data_source.dart';
import 'package:cliply_app/features/clipboard/data/datasources/clipboard_remote_datasource.dart';
import 'package:cliply_app/features/clipboard/data/repositories/clipboard_repository_impl.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ClipboardRepositoryImpl repo;
  bool _isServiceActive = false;
  final List<String> history = [];

  @override
  void initState() {
    super.initState();
    // Connect all the components
    final remoteDS = ClipboardRemoteDatasourceImpl();
    final localAccessDS = AccessibilityLocalDataSourceImpl();
    repo = ClipboardRepositoryImpl(
      remoteDS,
      localAccessDS,
    );
    _checkStatus();
  }

  void _checkStatus() async {
    final active = await repo.isServiceEnabled();
    setState(() => _isServiceActive = active);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Cliply Phase 1: Full Connection")),
        body: Column(
          children: [
            // Connection Status Indicator
            ListTile(
              tileColor: _isServiceActive ? Colors.green[100] : Colors.red[100],
              title: Text(_isServiceActive ? "Service Active" : "Service Disabled"),
              trailing: _isServiceActive 
                ? null 
                : ElevatedButton(
                    onPressed: () async {
                      await repo.requestPermission();
                      _checkStatus();
                    },
                    child: const Text("Enable"),
                  ),
            ),
            // The Live Stream
            Expanded(
              child: StreamBuilder<String>(
                stream: repo.watchClipboard(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && (history.isEmpty || history.first != snapshot.data)) {
                    history.insert(0, snapshot.data!);
                  }
                  return ListView.builder(
                    itemCount: history.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(history[index]),
                      leading: const Icon(Icons.copy),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}