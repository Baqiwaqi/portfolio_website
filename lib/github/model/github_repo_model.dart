import 'package:json_annotation/json_annotation.dart';

part 'github_repo_model.g.dart';

@JsonSerializable()
class GithubModel {
  GithubModel({
    this.name,
    this.url,
    this.description,
    this.stars,
    this.watchers,
    this.language,
  });

  final String? name;
  @JsonKey(name: "html_url")
  final String? url;
  final String? description;
  @JsonKey(name: "stargazers_count")
  final int? stars;
  @JsonKey(name: "watchers_count")
  final int? watchers;
  final String? language;

  factory GithubModel.fromJson(Map<String, dynamic> json) =>
      _$GithubModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubModelToJson(this);
}
