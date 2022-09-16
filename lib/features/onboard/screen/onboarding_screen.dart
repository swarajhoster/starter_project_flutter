import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:starter_project_flutter/features/onboard/controller/auth_controller.dart';
import 'package:starter_project_flutter/features/onboard/widget/onboarding_screen_button_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/on-boarding-screen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return SafeArea(
      child:IntroductionScreen(
                pages: [
                  PageViewModel(
                    title: 'A reader lives a thousand lives',
                    body: 'The man who never reads lives only one.',
                    image: buildImage(
                        'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg'),
                    decoration: getPageDecoration(),
                  ),
                  PageViewModel(
                    title: "",
                    bodyWidget: SingleChildScrollView(
                      child: Column(
                        children: const [
                          Text("The man who never reads lives only one."),
                          Text("The man who never reads lives only one."),
                        ],
                      ),
                    ),
                    image: buildImage(
                        'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg'),
                    decoration: getPageDecoration(),
                  ),
                  PageViewModel(
                    title: 'Featured Books',
                    body: 'Available right at your fingerprints',
                    image: buildImage(
                        'https://imaginovation.net/static/b35d3ed9e922415df7c292561d572891/3fcdd/10631-Importance-of-Web-App-1.webp'),
                    decoration: getPageDecoration(),
                  ),
                  PageViewModel(
                    title: 'Simple UI',
                    body: 'For enhanced reading experience',
                    image: buildImage(
                        'https://media.istockphoto.com/vectors/happy-young-employees-giving-support-and-help-each-other-vector-id1218490893?k=20&m=1218490893&s=612x612&w=0&h=svJxkZEFiciFHufK4LNn13TpNip1cVPW9Ig0Ahuugqs='),
                    decoration: getPageDecoration(),
                  ),
                  PageViewModel(
                    title: 'Today a reader, tomorrow a leader',
                    body: 'Start your journey',
                    footer: OnBoardingSCreenButtonWidget(
                      text: 'Login',
                      onClicked: () => controller.login(),
                    ),
                    image: buildImage(
                        'https://miro.medium.com/max/512/1*GaBtlHe240ZkwlcBrFczgQ.jpeg'),
                    decoration: getPageDecoration(),
                  ),
                ],
                done: InkWell(
                  onTap: () => controller.login(),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                onDone: () => controller.login(),
                showSkipButton: true,
                skip: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                next: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                dotsDecorator: getDotDecoration(),
                onChange: (index) => debugPrint('Page $index selected'),
                animationDuration: 600,
              ),
    );
  }

  Widget buildImage(String path) {
    return Center(child: Image.network(path, width: 350));
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
      color: const Color(0xFFBDBDBD),
      //activeColor: Colors.orange,
      size: const Size(8, 8),
      activeSize: const Size(20, 8),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      imagePadding: EdgeInsets.all(24),
    );
  }
}
