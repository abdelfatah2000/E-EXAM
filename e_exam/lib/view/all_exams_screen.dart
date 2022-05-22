import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/rebuild_nav_provider.dart';
import 'exam_screen.dart';

class AllExamsScreen extends StatelessWidget {
  const AllExamsScreen({Key? key}) : super(key: key);

  static const routeName = 'allExam';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final textSize = MediaQuery.of(context).textScaleFactor;

    final navProvider=Provider.of<NavigatorProvider>(context,);


    AppBar appBar = AppBar(
      toolbarHeight: deviceSize.height * .1,
      leading: Padding(
        padding:  EdgeInsetsDirectional.only(start: deviceSize.width*.01),
        child: IconButton(
          onPressed: () {
            int index= navProvider.currentIndex=0;
            navProvider.onTapItem(index);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
            size: textSize * 22,
          ),
        ),
      ),
      elevation: .05,
      shadowColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      title: Text(
        'Take Exam',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: textSize*23
        ),
      ),
      backgroundColor: Colors.white,
    );


    final bodyHeight = deviceSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        appBar.preferredSize.height;
    final bodyWidth = deviceSize.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: bodyHeight * .03,
        ),
        child: SizedBox(
          width: bodyWidth,
          child: ListView.separated(
            itemBuilder: (ctx, i) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: bodyWidth * .03,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, ExamScreen.routeName);

                },
                child: Container(
                  height: bodyHeight * .21,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10,),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: bodyHeight * .015,
                      start: bodyWidth * .03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'English Literature',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .8,
                              fontSize: textSize * 17),
                        ),
                        SizedBox(
                          height: bodyHeight * .015,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined,size: textSize*15,color: Colors.white,),
                            SizedBox(
                              width: bodyWidth * .02,
                            ),
                            Text(
                              '8 to 9 Feb, 2022',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: textSize*15,
                                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: bodyHeight*.005,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, ExamScreen.routeName);

                            },
                            child: const Text(
                              'Take Exam ->',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                                size: textSize*15,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: bodyWidth * .02,
                            ),
                            Text(
                              '10am to 1pm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: textSize*15,

                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: bodyHeight * .005,
                        ),
                        SizedBox(
                          height: bodyHeight*.05,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Take Exam ->',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: textSize*15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            separatorBuilder: (ctx, i) => SizedBox(
              height: bodyHeight * .025,
            ),
            itemCount: 8,
          ),
        ),
      ),
    );
  }
}
