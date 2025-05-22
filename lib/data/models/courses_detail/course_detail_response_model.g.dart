// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailResponseModelImpl _$$CourseDetailResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailResponseModelImpl(
      id: json['_id'] as String,
      author: json['author'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      path: (json['path'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$CourseDetailResponseModelImplToJson(
        _$CourseDetailResponseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
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
