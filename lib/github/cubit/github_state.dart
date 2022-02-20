part of 'github_cubit.dart';

abstract class GithubState {
  const GithubState();

  List<Object> get props => [];
}

class GithubInitial extends GithubState {}

class GithubLoadInProgress extends GithubState {}

class GithubLoadSuccess extends GithubState {
  final List<GithubModel> repos;

  const GithubLoadSuccess(
    this.repos,
  );

  @override
  List<Object> get props => [repos];
}

class GithubLoadFailure extends GithubState {}
