import 'package:cliply_app/features/clipboard/domain/repositories/clipboard_repository.dart';

class WatchClipboard {
  final ClipboardRepository repository;

  WatchClipboard(this.repository);
  
  Stream<String> call() {
    return repository.watchClipboard();
  }
}
  