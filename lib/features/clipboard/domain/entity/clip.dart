import 'package:freezed_annotation/freezed_annotation.dart';

part 'clip.freezed.dart';

@freezed
abstract class Clip with _$Clip {
 const factory Clip({
  required String id,
  required String content,
  required DateTime createdAt,
  required ClipType type,
  @Default(false) bool isPinned,
  String? folderId,
  String? label,
 }) = _Clip;
}

enum ClipType {
  text,
  url,
  phone,
  email,
}