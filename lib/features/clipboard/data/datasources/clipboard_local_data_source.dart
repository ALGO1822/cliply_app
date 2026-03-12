import 'package:cliply_app/core/error/exception.dart';
import 'package:cliply_app/features/clipboard/data/models/clip_model.dart';
import 'package:cliply_app/features/clipboard/data/models/folder_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

abstract class ClipboardLocalDataSource {
  // CLip Operations
  Future<List<ClipModel>> getAllClips();
  Future<List<ClipModel>> searchClips(String query);
  Future<void> saveClip(ClipModel clip);
  Future<void> editClip(ClipModel clip);
  Future<void> deleteClip(int id);

  // Folder Operations
  Future<void> createFolder(FolderModel folder);
  Future<void> editFolder(FolderModel folder);
  Future<void> deleteFolder(int id);
  Future<List<FolderModel>> getAllFolders();
  Future<void> initDefaultFolders();
}

class IsarClipboardDataSource implements ClipboardLocalDataSource {
  final Isar isar;
  IsarClipboardDataSource(this.isar);

  @override
  Future<void> initDefaultFolders() async {
    final count = await isar.folderModels.count();
    if (count == 0) {
      await isar.writeTxn(() async {
        final defaults = [
          FolderModel()
            ..name = 'Texts'
            ..iconCode = Icons.text_fields.codePoint
            ..isDefault = true,
          FolderModel()
            ..name = 'URLs'
            ..iconCode = Icons.link.codePoint
            ..isDefault = true,
          FolderModel()
            ..name = 'Phones'
            ..iconCode = Icons.phone.codePoint
            ..isDefault = true,
          FolderModel()
            ..name = 'Emails'
            ..iconCode = Icons.email.codePoint
            ..isDefault = true
        ];
        await isar.folderModels.putAll(defaults);
      });
    }
  }

  @override
  Future<void> createFolder(FolderModel folder) async {
    await isar.writeTxn(() async {
      await isar.folderModels.put(folder);
    });
  }

  @override
  Future<void> deleteClip(int id) async {
    await isar.writeTxn(() async {
      await isar.clipModels.delete(id);
    });
  }

  @override
  Future<void> deleteFolder(int id) async {
    final folder = await isar.folderModels.get(id);
    if (folder != null && !folder.isDefault) {
      await isar.writeTxn(() async => await isar.folderModels.delete(id));
    } else {
      throw DefualtSettingException("Cannot delete default folder");
    }
  }

  @override
  Future<List<ClipModel>> getAllClips() async {
    return await isar.clipModels.where().sortByCreatedAtDesc().findAll();
  }

  @override
  Future<List<FolderModel>> getAllFolders() async {
    return await isar.folderModels.where().findAll();
  }

  @override
  Future<void> saveClip(ClipModel clip) async {
    await isar.writeTxn(() async {
      await isar.clipModels.put(clip);
    });
  }

  @override
  Future<List<ClipModel>> searchClips(String query) async {
    return await isar.clipModels
        .filter()
        .contentContains(query, caseSensitive: false)
        .or()
        .labelContains(query, caseSensitive: false)
        .sortByCreatedAtDesc()
        .findAll();
  }

  @override
  Future<void> editClip(ClipModel clip) async {
    await isar.writeTxn(() async {
      await isar.clipModels.put(clip);
    });
  }

  @override
  Future<void> editFolder(FolderModel folder) async {
    if (folder.isDefault) {
      throw DefualtSettingException("Cannot modify default folder");
    }
    await isar.writeTxn(() async {
      await isar.folderModels.put(folder);
    });
  }
}
