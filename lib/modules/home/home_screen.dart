import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website_app/config/themes/constants.dart';
import 'package:portfolio_website_app/github/cubit/github_cubit.dart';
import 'package:portfolio_website_app/github/repository/github_repository.dart';
import 'package:portfolio_website_app/modules/home/widgets/home_banner.dart';
import 'package:portfolio_website_app/modules/portfolio/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      widgtes: [
        HomeBanner(),
        GithubProjects(),
      ],
    );
  }
}

class GithubProjects extends StatelessWidget {
  const GithubProjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GithubCubit(
        githubRepository: context.read<GithubRepository>(),
      )..loadGithubRepos(),
      child: const ProjectsView(),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(halfPadding),
      child: Column(
        children: [
          Text("My Projects",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black)),
          BlocBuilder<GithubCubit, GithubState>(
            builder: (context, state) {
              if (state is GithubLoadInProgress) {
                return const Loading();
              }
              if (state is GithubLoadSuccess) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.repos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: defaultPadding,
                      mainAxisSpacing: defaultPadding,
                    ),
                    itemBuilder: (context, index) {
                      final project = state.repos[index];
                      return Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        // color: backgroundColor,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: cardColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: const Offset(4, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${project.name}',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "${project.description}",
                                    maxLines: 7,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextButton(
                              onPressed: () async {
                                if (await canLaunch(project.url!)) {
                                  await launch(project.url!);
                                }
                              },
                              child: const Text(
                                "Go to repository",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
              if (state is GithubLoadFailure) {
                return const Failure();
              }
              return const Loading();
            },
          ),
        ],
      ),
    );
  }
}

class Failure extends StatelessWidget {
  const Failure({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text('Oops Something is wrong!!'),
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Github Reposotories are loading"),
          CircularProgressIndicator(color: primaryColor),
        ],
      ),
    );
  }
}
