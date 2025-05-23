// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonResponseModelImpl _$$LessonResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonResponseModelImpl(
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      path: (json['path'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$LessonResponseModelImplToJson(
        _$LessonResponseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'path': instance.path,
      'title': instance.title,
    };

_$PathImpl _$$PathImplFromJson(Map<String, dynamic> json) => _$PathImpl(
      fileName: json['fileName'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PathImplToJson(_$PathImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'url': instance.url,
    };
