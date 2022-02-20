// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubModel _$GithubModelFromJson(Map<String, dynamic> json) => GithubModel(
      name: json['name'] as String?,
      url: json['html_url'] as String?,
      description: json['description'] as String?,
      stars: json['stargazers_count'] as int?,
      watchers: json['watchers_count'] as int?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GithubModelToJson(GithubModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'html_url': instance.url,
      'description': instance.description,
      'stargazers_count': instance.stars,
      'watchers_count': instance.watchers,
      'language': instance.language,
    };
