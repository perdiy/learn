// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseResponseModelImpl _$$CourseResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseResponseModelImpl(
      id: json['_id'] as String?,
      author: json['author'] as String?,
      category: json['category'] as String?,
      chapter: (json['chapter'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      path: (json['path'] as List<dynamic>?)
          ?.map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$CourseResponseModelImplToJson(
        _$CourseResponseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'chapter': instance.chapter,
      'createdAt': instance.createdAt?.toIso8601String(),
      'path': instance.path,
      'title': instance.title,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

_$PathImpl _$$PathImplFromJson(Map<String, dynamic> json) => _$PathImpl(
      fileName: json['fileName'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$PathImplToJson(_$PathImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'url': instance.url,
    };
