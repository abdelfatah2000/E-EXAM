import 'dart:math';

import 'package:e_exam/view/dummy.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../view_model/professors_provider.dart';
import '../view_model/rebuild_nav_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'home';



  @override
  Widget build(BuildContext context) {
    final List colors = [
      HexColor('02783F'),
      HexColor('02784F'),
    ];

    final deviceSize = MediaQuery.of(context).size;
    final bodyHeight = deviceSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final bodyWidth = deviceSize.width;
    final textSize = MediaQuery.of(context).textScaleFactor;

    //////// لازم تباصي الداتا من اللوجن بتاعة اليوزر
    final profProvid = Provider.of<ProfessorsProvider>(
      context,
      listen: false,
    );
    final navProvider = Provider.of<NavigatorProvider>(
      context,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: deviceSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: bodyHeight * .04,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: SizedBox(
                        height: bodyHeight * .12,
                        child: Image.asset(
                          'assest/logo.webp',
                          filterQuality: FilterQuality.low,
                        )),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: bodyWidth * .03,
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        'assest/prof.png',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: bodyWidth * .03,
                    ),
                    child: Text(
                      'Hello, John Doe',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: textSize * 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * .01,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: bodyWidth * .03,
                    ),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize * 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: bodyHeight * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: bodyWidth * .03,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'My Professors',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: textSize * 17,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                int index = navProvider.currentIndex = 1;
                                navProvider.onTapItem(index);
                              },
                              child: const Text(
                                'See More..',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: bodyWidth,
                          height: bodyHeight * .22,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              if (profProvid.items.isNotEmpty) {
                                return SizedBox(
                                  width: bodyWidth * .38,
                                  height: bodyHeight * .2,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor:
                                        Theme.of(context).colorScheme.primary,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      textDirection: TextDirection.ltr,
                                      children: [
                                        SizedBox(
                                          width: bodyWidth * .34,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                    'assest/prof.png'     ,
                                                  ),
                                                  radius: 30,
                                                ),
                                                SizedBox(
                                                  height: bodyHeight * .01,
                                                ),
                                                Text(
                                                  'fdgdfg',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: bodyHeight * .015,
                                                ),
                                                Container(
                                                  height: bodyHeight * .045,
                                                  width: bodyWidth * .25,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                  ),
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        elevation:
                                                            MaterialStateProperty
                                                                .all(10)),
                                                    onPressed: () {
                                                      print(DateTime.now().millisecondsSinceEpoch);
                                                    },
                                                    child: const Text(
                                                      'Explore',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                        Positioned.fill(
                                            bottom: bodyHeight * .025,
                                            left: bodyWidth * .06,
                                            child: Image.asset(
                                              'assest/correct.jpg',
                                              filterQuality: FilterQuality.low,
                                              scale: 2,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    'No Professors Available',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: textSize * 20,
                                    ),
                                  ),
                                );
                              }
                            },
                            separatorBuilder: (ctx, i) => SizedBox(
                              width: bodyWidth * .02,
                            ),
                            itemCount: profProvid.items.isEmpty
                                ? 1
                                : profProvid.items.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: bodyHeight * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: bodyWidth * .03,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Take Exam',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: textSize * 17,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                int index = navProvider.currentIndex = 2;
                                navProvider.onTapItem(index);
                              },
                              child: const Text(
                                'See More..',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: bodyHeight * .0,
                        ),
                        SizedBox(
                          width: bodyWidth,
                          height: bodyHeight * .17,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              if (profProvid.items.isNotEmpty) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, Dummy.routeName);
                                  },
                                  child: Container(
                                    width: bodyWidth * .45,
                                    height: bodyHeight * .15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      color: colors[
                                          Random().nextInt(colors.length)],
                                      // Colors.primaries[Random()
                                      //     .nextInt(Colors.primaries.length)],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        top: bodyHeight * .012,
                                        start: bodyWidth * .03,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'English Literature',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: .8,
                                                fontSize: textSize * 12),
                                          ),
                                          SizedBox(
                                            height: bodyHeight * .012,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                size: textSize * 12,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: bodyWidth * .02,
                                              ),
                                              Text(
                                                '8 to 9 Feb, 2022',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: textSize * 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: bodyHeight * .005,
                                            child: const Text(
                                              'Take Exam ->',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.timer_outlined,
                                                size: textSize * 12,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: bodyWidth * .02,
                                              ),
                                              Text(
                                                '10am to 1pm',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: textSize * 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: deviceSize.height * .05,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Take Exam ->',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: textSize * 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    'No Exams Available',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: textSize * 20,
                                    ),
                                  ),
                                );
                              }
                            },
                            separatorBuilder: (ctx, i) => SizedBox(
                              width: bodyWidth * .02,
                            ),
                            itemCount: profProvid.items.isEmpty
                                ? 1
                                : profProvid.items.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: bodyWidth * .03,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Exam History',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: textSize * 17,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            int index = navProvider.currentIndex = 1;
                            navProvider.onTapItem(index);
                          },
                          child: const Text(
                            'See More..',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: bodyWidth,
                      height: bodyHeight * .7,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, i) {
                          if (profProvid.items.isNotEmpty) {
                            return SizedBox(
                              height: bodyHeight * .15,
                              child: Card(
                                shadowColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                elevation: 0,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    LayoutBuilder(
                                        builder: (context, constraints) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width: bodyWidth * .28,
                                        height: constraints.maxHeight,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                constraints.maxHeight * .06,
                                          ),
                                          child: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assest/examphoto.webp',
                                            ),
                                            radius: 30,
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      width: bodyWidth * .05,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Physics',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: textSize * 17,
                                          ),
                                        ),
                                        SizedBox(
                                          height: bodyHeight * .02,
                                        ),
                                        Text(
                                          'Score: 70/100',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: textSize * 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                'No Exams Taken',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: textSize * 20,
                                ),
                              ),
                            );
                          }
                        },
                        separatorBuilder: (ctx, i) => SizedBox(
                          height: bodyHeight * .005,
                        ),
                        itemCount: profProvid.items.isEmpty
                            ? 1
                            : profProvid.items.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
