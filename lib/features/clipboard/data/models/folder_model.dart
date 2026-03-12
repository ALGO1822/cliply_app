import 'package:isar/isar.dart';

part 'folder_model.g.dart';

@collection
class FolderModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  late int iconCode;

  late bool isDefault;
}
