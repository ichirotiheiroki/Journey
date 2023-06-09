import 'package:flutter/material.dart';
import 'package:journey/misc/colors.dart';
import 'package:journey/widgets/app_large_text.dart';
import 'package:journey/widgets/app_text.dart';
import 'package:journey/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img/welcome-one.png",
    "img/welcome-two.png",
    "img/welcome-three.png",
  ];

  List text = [
    "Это ёбаный пиздец потому что мне приходится изучать всё на скорую руку а психика едет и я ненавижу людей",
    "Это ёбаный пиздец потому что люди ублюдки редкостные и не заслуживают не то что существования а просто даже вероятности что их вспомнят",
    "Это ёбаный пиздец потому что мне стыдно за то что я тоже являюсь человеком"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                images[index]
              ),
                      fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 150,
                left: 20,
                right: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 35),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        margin: const EdgeInsets.only(top: 10),
                        child: AppText(
                          text: text[index],
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 20,),
                      ResponsiveButton(width: 120,)
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 4),

                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?AppColors.mainColor : AppColors.mainColor.withOpacity(0.5)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
