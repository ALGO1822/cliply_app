import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.freezed.dart';

@freezed
abstract class Folder with _$Folder {
  const factory Folder({
    required String id,
    required String name,
    required int iconCode,
    @Default(false) bool isDefault,
  }) = _Folder;
}