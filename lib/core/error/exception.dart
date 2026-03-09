class CacheException implements Exception {
  final String message;

  const CacheException(this.message);

  @override
  String toString() => 'CacheException: $message';
}

class ClipboardPermissionException implements Exception {
  final String message;
  ClipboardPermissionException([this.message = "Clipboard access denied"]);

  @override
  String toString() => "ClipboardPermissionException: $message";
}