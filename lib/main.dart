import 'package:cliply_app/features/clipboard/data/models/clip_model.dart';
import 'package:cliply_app/features/clipboard/data/models/folder_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  // ignore: unused_local_variable
  final isar = await Isar.open(
    [ClipModelSchema, FolderModelSchema],
    directory: dir.path,
  );

  runApp(const MyApp());
}

