import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/professors_provider.dart';
import '../view_model/rebuild_nav_provider.dart';

class AllProfScreen extends StatelessWidget {
  const AllProfScreen({Key? key}) : super(key: key);
  static const routeName = 'all_prof';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final textSize = MediaQuery.of(context).textScaleFactor;
    final profProvid = Provider.of<ProfessorsProvider>(
      context,
      listen: false,
    );
    final navProvider=Provider.of<NavigatorProvider>(context,);


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
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
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              end: deviceSize.width * .04,
            ),
            child:
           GestureDetector(
             onTap: (){},
             child: Icon(
                  Icons.search_sharp,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
           ),
            ),

        ],
        centerTitle: true,
        title: Text(
          'Professors',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: textSize*23,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: deviceSize.height * .02,
        ),
        child: SizedBox(
          width: deviceSize.width,
          child: ListView.separated(
            itemBuilder: (ctx, i) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * .03,
              ),
              child: SizedBox(
                height: deviceSize.height * .12,
                child: Card(
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: deviceSize.width * .04,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assest/prof.png',
                          ),
                          radius: 30,
                        ),
                        SizedBox(
                          width: deviceSize.width * .04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ahmed',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'maher',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: deviceSize.height * .015,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            separatorBuilder: (ctx, i) => SizedBox(
              height: deviceSize.height * .004,
            ),
            itemCount: profProvid.items.length,
          ),
        ),
      ),
    );
  }
}
