import 'package:flutter/material.dart';

class ProfDetailScreen extends StatefulWidget {
  const ProfDetailScreen({Key? key}) : super(key: key);

  static const routeName = 'detail';

  @override
  State<ProfDetailScreen> createState() => _ProfDetailScreenState();
}

class _ProfDetailScreenState extends State<ProfDetailScreen> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: deviceSize.height * .3,
                    width: deviceSize.width,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  PositionedDirectional(
                      top: deviceSize.height * .48,
                      start: deviceSize.width * .025,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              width: deviceSize.width * .95,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                color: Colors.white,
                                ///////////////////////////
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: deviceSize.width * .03,
                                    vertical: deviceSize.height * .03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'About Jerry',
                                        style: TextStyle(
                                          fontSize: deviceSize.height * .025,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: deviceSize.height * .02,
                                      ),
                                      Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently  desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: deviceSize.height * .02,
                                          wordSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: deviceSize.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: deviceSize.width * .03,
                            top: deviceSize.height * .05,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * .035,
                        ),
                        SizedBox(
                          width: deviceSize.width * .95,
                          height: deviceSize.height * .32,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: deviceSize.width * .15,
                                    top: deviceSize.height * .02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'jerry George',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                      Text(
                                        'New Jersey',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: .5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: deviceSize.height * .03,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: deviceSize.width * .08,
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '886',
                                            style: TextStyle(
                                              fontSize:
                                                  deviceSize.height * .022,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: deviceSize.height * .005,
                                          ),
                                          Text(
                                            'Subscribed',
                                            style: TextStyle(
                                              fontSize: deviceSize.height * .02,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: deviceSize.width * .08,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '39',
                                            style: TextStyle(
                                              fontSize:
                                                  deviceSize.height * .022,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: deviceSize.height * .005,
                                          ),
                                          Text(
                                            'Courses',
                                            style: TextStyle(
                                              fontSize: deviceSize.height * .02,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: deviceSize.width * .1,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height:
                                                    deviceSize.height * .036,
                                                width: deviceSize.width * .14,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5,
                                                  ),
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        deviceSize.width * .035,
                                                    vertical:
                                                        deviceSize.height *
                                                            .004,
                                                  ),
                                                  child: Text(
                                                    '4.0',
                                                    style: TextStyle(
                                                      fontSize:
                                                          deviceSize.height *
                                                              .02,
                                                      letterSpacing: 1.5,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: deviceSize.width * .02,
                                              ),
                                              Text(
                                                '(772)',
                                                style: TextStyle(
                                                  fontSize:
                                                      deviceSize.height * .02,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: deviceSize.height * .003,
                                          ),
                                          Text(
                                            'Avg. Ratings',
                                            style: TextStyle(
                                              fontSize: deviceSize.height * .02,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: deviceSize.height * .015,
                                ),
                                Divider(
                                  color: Colors.grey[400],
                                  thickness: 1,
                                ),

                                SizedBox(
                                  height: deviceSize.height * .1,
                                  child: LayoutBuilder(
                                    builder: (ctx,constraints){

                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsetsDirectional.only(start: constraints.maxWidth*.15,),
                                            child: SizedBox(
                                              height: constraints.maxHeight*.8,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(
                                                              () {
                                                            toggle = false;
                                                          },
                                                        );
                                                      },
                                                      autofocus: true,
                                                      child: Text(
                                                        'About',
                                                        style: TextStyle(
                                                          color: Theme.of(
                                                            context,
                                                          ).colorScheme.primary,
                                                          fontSize:
                                                          deviceSize.height *
                                                              .025,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      )),
                                                  if (!toggle)
                                                    Container(
                                                      width: deviceSize.width * .06,
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                      height:
                                                      deviceSize.height * .005,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:  EdgeInsetsDirectional.only(start: constraints.maxWidth*.25,),
                                            child: SizedBox(
                                              height: constraints.maxHeight*.8,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          toggle = true;
                                                        });
                                                      },
                                                      child: Text(
                                                        'Exams',
                                                        style: TextStyle(
                                                          color: Theme.of(
                                                            context,
                                                          ).colorScheme.primary,
                                                          fontSize:
                                                          deviceSize.height *
                                                              .025,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      )),
                                                  if (toggle)
                                                    Container(
                                                      width: deviceSize.width * .06,
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                      height:
                                                      deviceSize.height * .005,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    start: deviceSize.width * .11,
                    top: deviceSize.height * .1,
                    child:  const CircleAvatar(
                      backgroundImage: AssetImage('assest/prof.png',),
                      radius: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
