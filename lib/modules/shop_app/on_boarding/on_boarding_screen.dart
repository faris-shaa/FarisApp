import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/shop_app/login/shop_login_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.body,
    required this.image,
    required this.title,
});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var boardController = PageController();

  List<BoardingModel> boarding =
  [
    BoardingModel(
      image: 'images/onboarding_1.png',
      title: 'On Board 1 title',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image: 'images/onboarding_1.png',
      title: 'On Board 2 title',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image: 'images/onboarding_1.png',
      title: 'On Board 3 title',
      body: 'On Board 3 body',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          TextButton(
              onPressed: ()
              {
                NavigateAndFinish(context, ShopLoginScreen());
              },
              child: Text('SKIP'),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int indedx)
                {
                  if (indedx == boarding.length - 1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }else {
                    setState(() {
                      isLast = false;
                    });
                  }

                },
                itemBuilder: (context, index) => BuildBordaingItem (boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children:
              [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    activeDotColor: defaultColor,
                    expansionFactor: 4,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      NavigateAndFinish(context, ShopLoginScreen());
                    }
                    else
                    {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildBordaingItem (BoardingModel model) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Image(
        image: AssetImage('${model.image}'),
      ),
      const SizedBox(
        height: 45.0,
      ),
      Text(
        '${model.title}',
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10.0,

      ),
      Text(
        '${model.body}',
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}



