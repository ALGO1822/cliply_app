import 'package:cliply_app/core/error/failure.dart';
import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'package:cliply_app/features/clipboard/domain/entity/folder.dart';
import 'package:fpdart/fpdart.dart';

abstract class ClipboardRepository {
  // Accessibility Permission
  Future<bool> isServiceEnabled();
  Future<void> requestPermission();

  // Clipboard Collection Functionality
  Future<Either<Failure, List<Clip>>> getClips();
  Future<Either<Failure, List<Clip>>> searchClips(String query);
  Future<Either<Failure, void>> deleteClip(int id);
  Future<Either<Failure, void>> saveClip(String content);
  Future<Either<Failure, void>> editClip(Clip clip);

  // Folder Collection Functionality
  Future<Either<Failure, void>> initDefaultFolders();
  Future<Either<Failure, List<Folder>>> getAllFolders();
  Future<Either<Failure, void>> createFolder(Folder folder);
  Future<Either<Failure, void>> editFolder(Folder folder);
  Future<Either<Failure, void>> deleteFolder(int id);
  
  // Live Stream
  Stream<String> watchClipboard();
}