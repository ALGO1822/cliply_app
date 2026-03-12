// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Clip {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  ClipType get type => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  String? get folderId => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClipCopyWith<Clip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipCopyWith<$Res> {
  factory $ClipCopyWith(Clip value, $Res Function(Clip) then) =
      _$ClipCopyWithImpl<$Res, Clip>;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      ClipType type,
      bool isPinned,
      String? folderId,
      String? label});
}

/// @nodoc
class _$ClipCopyWithImpl<$Res, $Val extends Clip>
    implements $ClipCopyWith<$Res> {
  _$ClipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? type = null,
    Object? isPinned = null,
    Object? folderId = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipType,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipImplCopyWith<$Res> implements $ClipCopyWith<$Res> {
  factory _$$ClipImplCopyWith(
          _$ClipImpl value, $Res Function(_$ClipImpl) then) =
      __$$ClipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      ClipType type,
      bool isPinned,
      String? folderId,
      String? label});
}

/// @nodoc
class __$$ClipImplCopyWithImpl<$Res>
    extends _$ClipCopyWithImpl<$Res, _$ClipImpl>
    implements _$$ClipImplCopyWith<$Res> {
  __$$ClipImplCopyWithImpl(_$ClipImpl _value, $Res Function(_$ClipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? type = null,
    Object? isPinned = null,
    Object? folderId = freezed,
    Object? label = freezed,
  }) {
    return _then(_$ClipImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipType,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClipImpl implements _Clip {
  const _$ClipImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.type,
      this.isPinned = false,
      this.folderId,
      this.label});

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final ClipType type;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  final String? folderId;
  @override
  final String? label;

  @override
  String toString() {
    return 'Clip(id: $id, content: $content, createdAt: $createdAt, type: $type, isPinned: $isPinned, folderId: $folderId, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, content, createdAt, type, isPinned, folderId, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipImplCopyWith<_$ClipImpl> get copyWith =>
      __$$ClipImplCopyWithImpl<_$ClipImpl>(this, _$identity);
}

abstract class _Clip implements Clip {
  const factory _Clip(
      {required final String id,
      required final String content,
      required final DateTime createdAt,
      required final ClipType type,
      final bool isPinned,
      final String? folderId,
      final String? label}) = _$ClipImpl;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  ClipType get type;
  @override
  bool get isPinned;
  @override
  String? get folderId;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$ClipImplCopyWith<_$ClipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
