import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';

class TypeDetector {
  static ClipType detectType(String content) {
    if (RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+')
        .hasMatch(content)) {
      return ClipType.url; 
    } else if (RegExp(r'^\+?[0-9]{7,15}$').hasMatch(content)) {
      return ClipType.phone; 
    } else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(content)) {
      return ClipType.email; 
    }
    return ClipType.text; 
  }
}