// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioResponseModelImpl _$$AudioResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AudioResponseModelImpl(
      id: json['_id'] as String,
      artist: json['artist'] as String,
      createdAt: json['createdAt'] as String,
      description: json['description'] as String,
      isPremium: json['isPremium'] as String,
      languange: json['languange'] as String,
      path: (json['path'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: (json['thumbnail'] as List<dynamic>)
          .map((e) => Path.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['time'],
      title: json['title'] as String,
    );

Map<String, dynamic> _$$AudioResponseModelImplToJson(
        _$AudioResponseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'artist': instance.artist,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'isPremium': instance.isPremium,
      'languange': instance.languange,
      'path': instance.path,
      'thumbnail': instance.thumbnail,
      'time': instance.time,
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
