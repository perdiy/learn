// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonResponseModel _$LessonResponseModelFromJson(Map<String, dynamic> json) {
  return _LessonResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LessonResponseModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "path")
  List<Path> get path => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;

  /// Serializes this LessonResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonResponseModelCopyWith<LessonResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonResponseModelCopyWith<$Res> {
  factory $LessonResponseModelCopyWith(
          LessonResponseModel value, $Res Function(LessonResponseModel) then) =
      _$LessonResponseModelCopyWithImpl<$Res, LessonResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "path") List<Path> path,
      @JsonKey(name: "title") String title});
}

/// @nodoc
class _$LessonResponseModelCopyWithImpl<$Res, $Val extends LessonResponseModel>
    implements $LessonResponseModelCopyWith<$Res> {
  _$LessonResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? path = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<Path>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonResponseModelImplCopyWith<$Res>
    implements $LessonResponseModelCopyWith<$Res> {
  factory _$$LessonResponseModelImplCopyWith(_$LessonResponseModelImpl value,
          $Res Function(_$LessonResponseModelImpl) then) =
      __$$LessonResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "path") List<Path> path,
      @JsonKey(name: "title") String title});
}

/// @nodoc
class __$$LessonResponseModelImplCopyWithImpl<$Res>
    extends _$LessonResponseModelCopyWithImpl<$Res, _$LessonResponseModelImpl>
    implements _$$LessonResponseModelImplCopyWith<$Res> {
  __$$LessonResponseModelImplCopyWithImpl(_$LessonResponseModelImpl _value,
      $Res Function(_$LessonResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? path = null,
    Object? title = null,
  }) {
    return _then(_$LessonResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      path: null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<Path>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonResponseModelImpl implements _LessonResponseModel {
  const _$LessonResponseModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "path") required final List<Path> path,
      @JsonKey(name: "title") required this.title})
      : _path = path;

  factory _$LessonResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  final List<Path> _path;
  @override
  @JsonKey(name: "path")
  List<Path> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  @JsonKey(name: "title")
  final String title;

  @override
  String toString() {
    return 'LessonResponseModel(id: $id, createdAt: $createdAt, path: $path, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._path, _path) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt,
      const DeepCollectionEquality().hash(_path), title);

  /// Create a copy of LessonResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonResponseModelImplCopyWith<_$LessonResponseModelImpl> get copyWith =>
      __$$LessonResponseModelImplCopyWithImpl<_$LessonResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LessonResponseModel implements LessonResponseModel {
  const factory _LessonResponseModel(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "path") required final List<Path> path,
          @JsonKey(name: "title") required final String title}) =
      _$LessonResponseModelImpl;

  factory _LessonResponseModel.fromJson(Map<String, dynamic> json) =
      _$LessonResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "path")
  List<Path> get path;
  @override
  @JsonKey(name: "title")
  String get title;

  /// Create a copy of LessonResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonResponseModelImplCopyWith<_$LessonResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Path _$PathFromJson(Map<String, dynamic> json) {
  return _Path.fromJson(json);
}

/// @nodoc
mixin _$Path {
  @JsonKey(name: "fileName")
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Path to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Path
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathCopyWith<Path> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathCopyWith<$Res> {
  factory $PathCopyWith(Path value, $Res Function(Path) then) =
      _$PathCopyWithImpl<$Res, Path>;
  @useResult
  $Res call(
      {@JsonKey(name: "fileName") String fileName,
      @JsonKey(name: "url") String url});
}

/// @nodoc
class _$PathCopyWithImpl<$Res, $Val extends Path>
    implements $PathCopyWith<$Res> {
  _$PathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Path
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PathImplCopyWith<$Res> implements $PathCopyWith<$Res> {
  factory _$$PathImplCopyWith(
          _$PathImpl value, $Res Function(_$PathImpl) then) =
      __$$PathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fileName") String fileName,
      @JsonKey(name: "url") String url});
}

/// @nodoc
class __$$PathImplCopyWithImpl<$Res>
    extends _$PathCopyWithImpl<$Res, _$PathImpl>
    implements _$$PathImplCopyWith<$Res> {
  __$$PathImplCopyWithImpl(_$PathImpl _value, $Res Function(_$PathImpl) _then)
      : super(_value, _then);

  /// Create a copy of Path
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? url = null,
  }) {
    return _then(_$PathImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PathImpl implements _Path {
  const _$PathImpl(
      {@JsonKey(name: "fileName") required this.fileName,
      @JsonKey(name: "url") required this.url});

  factory _$PathImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathImplFromJson(json);

  @override
  @JsonKey(name: "fileName")
  final String fileName;
  @override
  @JsonKey(name: "url")
  final String url;

  @override
  String toString() {
    return 'Path(fileName: $fileName, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, url);

  /// Create a copy of Path
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathImplCopyWith<_$PathImpl> get copyWith =>
      __$$PathImplCopyWithImpl<_$PathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathImplToJson(
      this,
    );
  }
}

abstract class _Path implements Path {
  const factory _Path(
      {@JsonKey(name: "fileName") required final String fileName,
      @JsonKey(name: "url") required final String url}) = _$PathImpl;

  factory _Path.fromJson(Map<String, dynamic> json) = _$PathImpl.fromJson;

  @override
  @JsonKey(name: "fileName")
  String get fileName;
  @override
  @JsonKey(name: "url")
  String get url;

  /// Create a copy of Path
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathImplCopyWith<_$PathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
