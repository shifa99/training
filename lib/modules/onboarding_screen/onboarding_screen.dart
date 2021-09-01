import 'package:e_school/models/onboarding_model.dart';
import 'package:e_school/modules/introduce_screen/introduce_screen.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = 'onboardingScreen';
  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: responsiveWidget(responsive: (context, deviceInfo) {
                return Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'تخطي',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                PageView.builder(
                                    physics: BouncingScrollPhysics(),
                                    controller: controller,
                                    itemCount: onboardings.length,
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                        onboardings[index].imageName,
                                        fit: BoxFit.cover,
                                      );
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'استمتع واختبر نفسك',
                            style: TextStyle(
                              fontSize: deviceInfo.screenHeight * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: deviceInfo.screenHeight * 0.08,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SmoothPageIndicator(
                            controller: controller!,
                            count: 3,
                            effect: ExpandingDotsEffect(),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              if (controller!.page!.toInt() == 2) {
                                Navigator.pushNamed(
                                    context, IntroduceScreen.routeName);
                              }
                              controller!.nextPage(
                                  duration: Duration(
                                    milliseconds: 300,
                                  ),
                                  curve: Curves.bounceInOut);
                            },
                            child: Text('التالي'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                );
              }))),
    );
  }
}
