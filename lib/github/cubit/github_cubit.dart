import 'package:bloc/bloc.dart';
import 'package:portfolio_website_app/github/repository/github_repository.dart';
import 'package:portfolio_website_app/github/model/github_repo_model.dart';

part 'github_state.dart';

class GithubCubit extends Cubit<GithubState> {
  GithubCubit({required this.githubRepository}) : super(GithubInitial());

  final GithubRepository githubRepository;

  void loadGithubRepos() async {
    emit(GithubLoadInProgress());
    try {
      List<GithubModel>? repos = await githubRepository.fetchRepo();
      emit(GithubLoadSuccess(repos));
    } catch (e) {
      emit(GithubLoadFailure());
    }
  }
}
