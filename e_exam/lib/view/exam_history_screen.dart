import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/rebuild_nav_provider.dart';

class ExamHistoryScreen extends StatelessWidget {
  const ExamHistoryScreen({Key? key}) : super(key: key);
  static String routeName = 'examHistory';
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
        'Exam History',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: textSize*23,
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
      backgroundColor: Colors.grey[100],
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
              child: SizedBox(
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
                    children: [
                      LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[50],
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
                        width: bodyWidth * .05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ),
            separatorBuilder: (ctx, i) => SizedBox(
              height: bodyHeight * .005,
            ),
            itemCount: 8,
          ),
        ),
      ),
    );
  }
}
