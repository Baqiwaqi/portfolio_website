import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website_app/config/themes/constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
          ),
          Container(color: Colors.grey.withOpacity(0.6)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello World",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  width: 800,
                  child: Text(
                    "You can describe me as a proactive person, someone who likes to work in teams and who enjoys working with the most recent developments in ICT. In my spare time I do a lot of bouldering and I train hard to get better at it.",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                const AnimatedHeaderText(),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: TextButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: defaultPadding * 2,
                //       vertical: defaultPadding,
                //     ),
                //     backgroundColor: primaryColor,
                //   ),
                //   child: const Text(
                //     "Explore Now",
                //     style: TextStyle(color: primaryDarkBlue),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedHeaderText extends StatelessWidget {
  const AnimatedHeaderText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
      child: Row(
        children: [
          const CodedStyledText(),
          const Text("I build "),
          AnimatedTextKit(
            pause: const Duration(seconds: 2),
            animatedTexts: [
              // TODO: create text slowdown speed: duration(miliseconds: 60),
              TyperAnimatedText(
                "a responsive web and Mobile",
              ),
              TyperAnimatedText(
                  "an appliction to store your coffee preferences"),
              TyperAnimatedText("a warehouse management system"),
            ],
          ),
          const CodedStyledText(),
        ],
      ),
    );
  }
}

class CodedStyledText extends StatelessWidget {
  const CodedStyledText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(text: "<", children: [
        TextSpan(
          text: "Flutter",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(text: ">")
      ]),
    );
  }
}
