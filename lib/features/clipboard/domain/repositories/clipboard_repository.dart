import 'package:cliply_app/core/error/failure.dart';
import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'package:fpdart/fpdart.dart';

abstract class ClipboardRepository {
  Future<bool> isServiceEnabled();
  Future<void> requestPermission();
  Future<Either<Failure, List<Clip>>> getClips();
  Stream<String> watchClipboard();
}