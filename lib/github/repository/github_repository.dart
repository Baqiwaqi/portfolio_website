import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio_website_app/github/model/github_repo_model.dart';

class GithubRepository {
  Future<List<GithubModel>> fetchRepo() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/Baqiwaqi/repos'));
    if (response.statusCode != 200) {
      throw Exception('error getting rockets');
    }

    final githubJson = jsonDecode(response.body) as List;
    List<GithubModel> githubRepos =
        githubJson.map((json) => GithubModel.fromJson(json)).toList();

    return githubRepos;
  }
}
