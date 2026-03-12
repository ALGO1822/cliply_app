import 'package:cliply_app/core/error/exception.dart';
import 'package:cliply_app/core/error/failure.dart';
import 'package:cliply_app/core/utils/type_detector.dart';
import 'package:cliply_app/features/clipboard/data/datasources/accessibility_local_data_source.dart';
import 'package:cliply_app/features/clipboard/data/datasources/clipboard_local_data_source.dart';
import 'package:cliply_app/features/clipboard/data/datasources/clipboard_remote_datasource.dart';
import 'package:cliply_app/features/clipboard/data/models/clip_mapper.dart';
import 'package:cliply_app/features/clipboard/data/models/folder_mapper.dart';
import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'package:cliply_app/features/clipboard/domain/entity/folder.dart';
import 'package:cliply_app/features/clipboard/domain/repositories/clipboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  final ClipboardRemoteDatasource remoteDatasource;
  final AccessibilityLocalDataSource accessibilityDataSource;
  final ClipboardLocalDataSource localDataSource;

  ClipboardRepositoryImpl(this.remoteDatasource, this.accessibilityDataSource, this.localDataSource);

  String _getFolderNameFromType(ClipType type) {
    switch (type) {
      case ClipType.url: return 'URLs';
      case ClipType.phone: return 'Phones';
      case ClipType.email: return 'Emails';
      case ClipType.text: return 'Texts';
    }
  }

  @override
  Future<Either<Failure, List<Clip>>> getClips() async {
    try {
      final models = await localDataSource.getAllClips();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
  
  @override
  Stream<String> watchClipboard() {
      return remoteDatasource.clipboardStream;
  }
  
  @override
  Future<bool> isServiceEnabled() {
    return accessibilityDataSource.isServiceEnabled();
  }
  
  @override
  Future<void> requestPermission() {
    return accessibilityDataSource.requestPermission();
  }

  @override
  Future<Either<Failure, void>> createFolder(Folder folder) async {
    try {
      final existingFolders = await localDataSource.getAllFolders();
      final isDuplicate = existingFolders.any((f) => f.name.toLowerCase() == folder.name.toLowerCase());

      if (isDuplicate) {
        return Left(CacheFailure('Folder with name "${folder.name}" already exists.'));
      }

      await localDataSource.createFolder(folder.toModel());
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteClip(int id) async {
    try {
      await localDataSource.deleteClip(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFolder(int id) async {
    try {
      await localDataSource.deleteFolder(id);
      return const Right(null);
    } on DefualtSettingException catch (_) {
      return Left(CacheFailure('Default folders cannot be deleted'));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editClip(Clip clip) async {
    try {
      await localDataSource.editClip(clip.toModel());
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editFolder(Folder folder) async {
    try {
      final existingFolders = await localDataSource.getAllFolders();
      final nameTaken = existingFolders.any((f) => f.name.toLowerCase() == folder.name.toLowerCase() && f.id.toString() != folder.id);

      if (nameTaken) {
        return Left(CacheFailure('The new Foldername is already in use'));
      }

      await localDataSource.editFolder(folder.toModel());
      return const Right(null);
    } on DefualtSettingException {
      return Left(CacheFailure('Default folders cannot be edited'));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Folder>>> getAllFolders() async {
    try {
      final models = await localDataSource.getAllFolders();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> initDefaultFolders() async {
    try {
      await (localDataSource as IsarClipboardDataSource).initDefaultFolders();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveClip(String content) async {
    try {
      final allClips = await localDataSource.getAllClips();
      if (allClips.isNotEmpty && allClips.first.content == content) {
        return const Right(null); // No need to save duplicate content
      } 

      final type = TypeDetector.detectType(content);
      final folders = await localDataSource.getAllFolders();

      final targetFolderName = _getFolderNameFromType(type);
      final folderModel = folders.firstWhere(
        (f) => f.name == targetFolderName,
        orElse: () => folders.first,
      );

      final clipModel = ClipEntityMapper(Clip(
        id: const Uuid().v4(),
        content: content,
        createdAt: DateTime.now(),
        type: type,
      )).toModel();

      clipModel.folder.value = folderModel;
      await localDataSource.saveClip(clipModel);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Clip>>> searchClips(String query) async {
    try {
      final models = await localDataSource.searchClips(query);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
