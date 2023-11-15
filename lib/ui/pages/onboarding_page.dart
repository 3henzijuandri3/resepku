import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resepku/shared/app_theme.dart';
import 'package:resepku/ui/widgets/buttons_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  CarouselController carouselController = CarouselController();
  int currentPage = 0;

  List text1 = [
    'Grow Your\nFood Knowledge',
    'Learn Cooking\nZero to Chef',
    'Start Cooking'
  ];

  List text2 = [
    'Resepku is helping you to cook\nyour favorite food',
    'We provide you cooking recipe\nso that you can cook easier',
    'We will guide you to where\n you wanted it to'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Image Carousel
          CarouselSlider(
            carouselController: carouselController,

            items: [
              Image.asset(
                'assets/img_onboarding1.png',
                height: 330,
              ),

              Image.asset(
                'assets/img_onboarding2.png',
                height: 330,
              ),

              Image.asset(
                'assets/img_onboarding3.png',
                height: 330,
              ),
            ],

            options: CarouselOptions(
              height: 330,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),

          ),

          const SizedBox(height: 60),

          //Onboarding Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 22),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),

            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Text 1
                Text(
                  text1[currentPage],
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                  ),
                ),

                const SizedBox(height: 26),

                // Text 2
                Text(
                  text2[currentPage],
                  textAlign: TextAlign.center,
                  style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular
                  ),
                ),

                const SizedBox(height: 45),

                currentPage == 2

                    ? filledButtonCustom(
                    width: double.infinity,
                    height: 50,
                    label: 'Discover More',
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('onboarding_complete', true);

                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                    })

                    : Row(
                  children: [

                    // Bullet Color
                    InkWell(
                      onTap: (){
                        currentPage = 0;
                        carouselController.animateToPage(0);
                      },
                      child: Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 14),

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == 0 ? yellowColor : greyColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        currentPage = 1;
                        carouselController.animateToPage(1);
                      },
                      child: Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 14),

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == 1 ? yellowColor : greyColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        currentPage = 2;
                        carouselController.animateToPage(2);
                      },
                      child: Container(
                        width: 12,
                        height: 12,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == 2 ? yellowColor : greyColor,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Button Continue
                    filledButtonCustom(
                        width: 150,
                        height: 50,
                        label: 'Continue',
                        onTap: (){
                          carouselController.nextPage();
                        }
                    ),
                  ],
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}


























