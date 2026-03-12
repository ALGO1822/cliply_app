import 'package:cliply_app/features/clipboard/domain/entity/folder.dart';
import 'folder_model.dart';

extension FolderMapper on FolderModel {
  Folder toEntity() {
    return Folder(
      id: id.toString(),
      name: name,
      iconCode: iconCode,
      isDefault: isDefault,
    );
  }
}

extension FolderEntityMapper on Folder {
  FolderModel toModel() {
    return FolderModel()
      ..id = int.tryParse(id) ?? 0
      ..name = name
      ..iconCode = iconCode
      ..isDefault = isDefault;
  }
}