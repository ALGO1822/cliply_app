import 'package:cliply_app/core/error/failure.dart';
import 'package:cliply_app/features/clipboard/data/datasources/accessibility_local_data_source.dart';
import 'package:cliply_app/features/clipboard/data/datasources/clipboard_remote_datasource.dart';
import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'package:cliply_app/features/clipboard/domain/repositories/clipboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  final ClipboardRemoteDatasource remoteDatasource;
  final AccessibilityLocalDataSource accessibilityDataSource;

  ClipboardRepositoryImpl(this.remoteDatasource, this.accessibilityDataSource);

  @override
  Future<Either<Failure, List<Clip>>> getClips() async {
    return const Right([]);
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
}
