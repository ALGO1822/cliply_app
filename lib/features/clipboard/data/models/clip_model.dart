import 'package:cliply_app/features/clipboard/data/models/folder_model.dart';
import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'package:isar/isar.dart';

part 'clip_model.g.dart';

@collection
class ClipModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String id;

  @Index(type: IndexType.value)
  late String content;

  @Index()
  late DateTime createdAt;

  @enumerated
  late ClipType type;

  late bool isPinned;

  final folder = IsarLink<FolderModel>();

  String? label;
}