// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioResponseModel _$AudioResponseModelFromJson(Map<String, dynamic> json) {
  return _AudioResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AudioResponseModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "artist")
  String get artist => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "isPremium")
  String get isPremium => throw _privateConstructorUsedError;
  @JsonKey(name: "languange")
  String get languange => throw _privateConstructorUsedError;
  @JsonKey(name: "path")
  List<Path> get path => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail")
  List<Path> get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  dynamic get time => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;

  /// Serializes this AudioResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioResponseModelCopyWith<AudioResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioResponseModelCopyWith<$Res> {
  factory $AudioResponseModelCopyWith(
          AudioResponseModel value, $Res Function(AudioResponseModel) then) =
      _$AudioResponseModelCopyWithImpl<$Res, AudioResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "artist") String artist,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "isPremium") String isPremium,
      @JsonKey(name: "languange") String languange,
      @JsonKey(name: "path") List<Path> path,
      @JsonKey(name: "thumbnail") List<Path> thumbnail,
      @JsonKey(name: "time") dynamic time,
      @JsonKey(name: "title") String title});
}

/// @nodoc
class _$AudioResponseModelCopyWithImpl<$Res, $Val extends AudioResponseModel>
    implements $AudioResponseModelCopyWith<$Res> {
  _$AudioResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artist = null,
    Object? createdAt = null,
    Object? description = null,
    Object? isPremium = null,
    Object? languange = null,
    Object? path = null,
    Object? thumbnail = null,
    Object? time = freezed,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as String,
      languange: null == languange
          ? _value.languange
          : languange // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<Path>,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as List<Path>,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioResponseModelImplCopyWith<$Res>
    implements $AudioResponseModelCopyWith<$Res> {
  factory _$$AudioResponseModelImplCopyWith(_$AudioResponseModelImpl value,
          $Res Function(_$AudioResponseModelImpl) then) =
      __$$AudioResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "artist") String artist,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "isPremium") String isPremium,
      @JsonKey(name: "languange") String languange,
      @JsonKey(name: "path") List<Path> path,
      @JsonKey(name: "thumbnail") List<Path> thumbnail,
      @JsonKey(name: "time") dynamic time,
      @JsonKey(name: "title") String title});
}

/// @nodoc
class __$$AudioResponseModelImplCopyWithImpl<$Res>
    extends _$AudioResponseModelCopyWithImpl<$Res, _$AudioResponseModelImpl>
    implements _$$AudioResponseModelImplCopyWith<$Res> {
  __$$AudioResponseModelImplCopyWithImpl(_$AudioResponseModelImpl _value,
      $Res Function(_$AudioResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artist = null,
    Object? createdAt = null,
    Object? description = null,
    Object? isPremium = null,
    Object? languange = null,
    Object? path = null,
    Object? thumbnail = null,
    Object? time = freezed,
    Object? title = null,
  }) {
    return _then(_$AudioResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as String,
      languange: null == languange
          ? _value.languange
          : languange // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<Path>,
      thumbnail: null == thumbnail
          ? _value._thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as List<Path>,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioResponseModelImpl implements _AudioResponseModel {
  const _$AudioResponseModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "artist") required this.artist,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "isPremium") required this.isPremium,
      @JsonKey(name: "languange") required this.languange,
      @JsonKey(name: "path") required final List<Path> path,
      @JsonKey(name: "thumbnail") required final List<Path> thumbnail,
      @JsonKey(name: "time") required this.time,
      @JsonKey(name: "title") required this.title})
      : _path = path,
        _thumbnail = thumbnail;

  factory _$AudioResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "artist")
  final String artist;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "isPremium")
  final String isPremium;
  @override
  @JsonKey(name: "languange")
  final String languange;
  final List<Path> _path;
  @override
  @JsonKey(name: "path")
  List<Path> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  final List<Path> _thumbnail;
  @override
  @JsonKey(name: "thumbnail")
  List<Path> get thumbnail {
    if (_thumbnail is EqualUnmodifiableListView) return _thumbnail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnail);
  }

  @override
  @JsonKey(name: "time")
  final dynamic time;
  @override
  @JsonKey(name: "title")
  final String title;

  @override
  String toString() {
    return 'AudioResponseModel(id: $id, artist: $artist, createdAt: $createdAt, description: $description, isPremium: $isPremium, languange: $languange, path: $path, thumbnail: $thumbnail, time: $time, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.languange, languange) ||
                other.languange == languange) &&
            const DeepCollectionEquality().equals(other._path, _path) &&
            const DeepCollectionEquality()
                .equals(other._thumbnail, _thumbnail) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      artist,
      createdAt,
      description,
      isPremium,
      languange,
      const DeepCollectionEquality().hash(_path),
      const DeepCollectionEquality().hash(_thumbnail),
      const DeepCollectionEquality().hash(time),
      title);

  /// Create a copy of AudioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioResponseModelImplCopyWith<_$AudioResponseModelImpl> get copyWith =>
      __$$AudioResponseModelImplCopyWithImpl<_$AudioResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AudioResponseModel implements AudioResponseModel {
  const factory _AudioResponseModel(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "artist") required final String artist,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "description") required final String description,
          @JsonKey(name: "isPremium") required final String isPremium,
          @JsonKey(name: "languange") required final String languange,
          @JsonKey(name: "path") required final List<Path> path,
          @JsonKey(name: "thumbnail") required final List<Path> thumbnail,
          @JsonKey(name: "time") required final dynamic time,
          @JsonKey(name: "title") required final String title}) =
      _$AudioResponseModelImpl;

  factory _AudioResponseModel.fromJson(Map<String, dynamic> json) =
      _$AudioResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "artist")
  String get artist;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "isPremium")
  String get isPremium;
  @override
  @JsonKey(name: "languange")
  String get languange;
  @override
  @JsonKey(name: "path")
  List<Path> get path;
  @override
  @JsonKey(name: "thumbnail")
  List<Path> get thumbnail;
  @override
  @JsonKey(name: "time")
  dynamic get time;
  @override
  @JsonKey(name: "title")
  String get title;

  /// Create a copy of AudioResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioResponseModelImplCopyWith<_$AudioResponseModelImpl> get copyWith =>
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
