import 'package:e_exam/view/app_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExamResultScreen extends StatelessWidget {
  const ExamResultScreen({Key? key}) : super(key: key);
  static String routeName = 'examResult';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final bodyHeight = deviceSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final bodyWidth = deviceSize.width;
    final textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        height: bodyHeight * .22,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: bodyWidth * .04,
            end: bodyWidth * .04,
            top: bodyHeight * .02,
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: bodyWidth * .4,
                    height: bodyHeight * .1,
                    child: ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Center(
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: textSize * 15,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    width: bodyWidth * .004))),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: bodyWidth * .4,
                    height: bodyHeight * .1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(AppStartScreen.routeName,);
                      },
                      child: Center(
                        child: Text(
                          'Go Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: textSize * 15,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: bodyHeight * .1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: bodyWidth * .04,
              ),
              child: SizedBox(
                height: bodyHeight * .18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Result',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                          fontSize: textSize * 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: bodyWidth*.02),
              child: Container(
                height: bodyHeight * .52,
                width: bodyWidth,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: bodyHeight*.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: bodyHeight * .15,
                        child: Card(
                          shadowColor: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          elevation: 0,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LayoutBuilder(builder: (context, constraints) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: bodyWidth * .28,
                                  height: constraints.maxHeight,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: constraints.maxHeight * .06,
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
                                width: bodyWidth * .1,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Physics',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: textSize *25,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'You\'re score is',
                        style: TextStyle(
                          color:Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                          fontSize: textSize * 35,
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight*.02,
                      ),

                      Text(
                        '70/100',
                        style: TextStyle(
                          color:Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                          fontSize: textSize * 35,
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight*.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Center(
                              child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('15',style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: textSize*18
                                  ),),
                                  Text('Right',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: textSize*18
                                  ),),

                                ],
                              ),
                            ),
                            width: bodyWidth*.22,
                            height: bodyHeight*.11,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(15,),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('15',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: textSize*18
                                  ),),
                                  Text('Wrong',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: textSize*18
                                  ),),

                                ],
                              ),
                            ),
                            width: bodyWidth*.22,
                            height: bodyHeight*.11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15,),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('15',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: textSize*18
                                  ),),
                                  Text('Skipped',style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: textSize*18
                                  ),),

                                ],
                              ),
                            ),
                            width: bodyWidth*.22,
                            height: bodyHeight*.11,
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(15,),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
