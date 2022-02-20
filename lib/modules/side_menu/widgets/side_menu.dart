import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website_app/config/themes/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MyInfo(),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: const [
                // TODO: EDIT arangement
                TextInfoArea(title: "Woonplaats", text: "Nederland"),
                TextInfoArea(title: "Stad", text: "Amsterdam"),
                TextInfoArea(title: "Leeftijd", text: "25"),
                TextInfoArea(title: "Email", text: "timbouma6@gmail.com"),
                Skills(),
                Coding(),
                Knowledges(),
                Divider(),
                // Socials(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Socials extends StatelessWidget {
  const Socials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: halfPadding),
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                splashRadius: 18,
                onPressed: () async {
                  if (await canLaunch(
                      "https://www.linkedin.com/in/tim-bouma-74716996/")) {
                    await launch(
                        "https://www.linkedin.com/in/tim-bouma-74716996/");
                  }
                },
                icon: SvgPicture.asset(
                  'assets/icons/linkedin.svg',
                  color: Colors.black,
                ),
              ),
              IconButton(
                splashRadius: 18,
                onPressed: () async {
                  if (await canLaunch("https://github.com/Baqiwaqi")) {
                    await launch("https://github.com/Baqiwaqi");
                  }
                },
                icon: SvgPicture.asset(
                  'assets/icons/github.svg',
                  color: Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        TextButton.icon(
          onPressed: () async {
            try {
              final downloadURl = await firebase_storage
                  .FirebaseStorage.instance
                  .ref('resume.pdf')
                  .getDownloadURL();
              if (await canLaunch(downloadURl)) {
                launch(downloadURl);
              }
            } on firebase_storage.FirebaseStorage catch (e) {
              print("Downloading was not possible $e");
            }
          },
          icon: const Icon(
            Icons.download,
            color: Colors.black,
          ),
          label: const Text(
            "Download CV",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class Knowledges extends StatelessWidget {
  const Knowledges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          child: Text(
            "Vaardigheden",
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black),
          ),
        ),
        const VaardighedenText(
          text: "Flutter, Dart, React.js, Next.js",
          icon: Icon(Icons.check),
        ),
        const VaardighedenText(
          text: "Google Cloud, AWS, Cloud Functions",
          icon: Icon(Icons.cloud),
        ),
        const VaardighedenText(
            text: "Git, Github, Markdown", icon: Icon(Icons.upload)),
      ],
    );
  }
}

class VaardighedenText extends StatelessWidget {
  const VaardighedenText({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: defaultPadding),
        Text(text),
      ],
    );
  }
}

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          child: Text(
            "Coding",
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black),
          ),
        ),
        const AnimatedLinearProgressIndicator(
          label: "Dart",
          percentage: 0.75,
        ),
        const AnimatedLinearProgressIndicator(
          label: "Javascript",
          percentage: 0.7,
        ),
        const AnimatedLinearProgressIndicator(
          label: "HTML",
          percentage: 0.75,
        ),
        const AnimatedLinearProgressIndicator(
          label: "CSS",
          percentage: 0.70,
        ),
      ],
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.label,
    required this.percentage,
  }) : super(key: key);
  final String label;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: defaultDuration,
          builder: (context, double value, child) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        (value * 100).toInt().toString() + " %",
                      )
                    ],
                  ),
                  LinearProgressIndicator(
                    value: value,
                    color: primaryColor,
                    backgroundColor: primaryColor.withOpacity(0.2),
                  ),
                ],
              )),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          child: Text(
            "Skills",
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            AnimatedCircularProgressIndicator(
              label: "Flutter",
              percentage: 0.8,
            ),
            AnimatedCircularProgressIndicator(
              label: "Firebase",
              percentage: 0.7,
            ),
            AnimatedCircularProgressIndicator(
              label: "React",
              percentage: 0.6,
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.label,
    required this.percentage,
  }) : super(key: key);

  final String label;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: percentage,
                ),
                duration: defaultDuration,
                builder: (context, double value, child) => Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      color: primaryColor,
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                    Center(
                      child: Text(
                        (value * 100).toInt().toString() + " %",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              label,
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class TextInfoArea extends StatelessWidget {
  const TextInfoArea({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.black),
        ),
        Text(text),
      ],
    );
  }
}

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 2),
            const CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            const Spacer(),
            Text(
              "Tim Bouma",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.black),
            ),
            const Text(
              "Software Developer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            const Socials(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
