import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'clip_model.dart';

extension ClipMapper on ClipModel {
  Clip toEntity() {
    return Clip(
      id: id,
      content: content,
      createdAt: createdAt,
      type: type,
      isPinned: isPinned,
      label: label,
      folderId: folder.value?.id.toString(),
    );
  }
}

extension ClipEntityMapper on Clip {
  ClipModel toModel() {
    return ClipModel()
      ..id = id
      ..content = content
      ..createdAt = createdAt
      ..type = type
      ..isPinned = isPinned
      ..label = label;
  }
}