import 'dart:async';

import 'package:e_exam/model/question.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exam_result_screen.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);
  static String routeName = 'Dummy';

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> with AutomaticKeepAliveClientMixin<Dummy>{
  int timeLeft = 20;
  late Timer _timer;
  void getTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Exam',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'you can\'t go anywhere . you\'re in the dark here you sorry shit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'FUCK OFF! ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }



  late SharedPreferences preferences;

  @override
  void initState(){

    super.initState();
    init();

  }

     void init()async{
  preferences=await  SharedPreferences.getInstance();

}
 final List<String> _selectedValue=[];

  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {

    super.build(context);

    final deviceSize = MediaQuery.of(context).size;
    final bodyHeight = deviceSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final bodyWidth = deviceSize.width;
    final textSize = MediaQuery.of(context).textScaleFactor;
    return WillPopScope(
      onWillPop: () {
        return _onWillPop();
      },
      child: Scaffold(
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
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: bodyWidth * .3,
                      height: bodyHeight * .065,
                      child: ElevatedButton(
                        onPressed: indQues <= 0
                            ? null
                            : () {
                                setState(() {
                                  indQues--;
                                });
                              },
                        child: Center(
                          child: Text(
                            'Previous',
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
                      width: bodyWidth * .3,
                      height: bodyHeight * .065,
                      child: ElevatedButton(
                        onPressed: indQues == sample_data.length - 1
                            ? null
                            : () {
                                setState(() {
                                  indQues++;
                                });
                              },
                        child: Center(
                          child: Text(
                            'Next',
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
                SizedBox(
                  height: bodyHeight * .03,
                ),
                SizedBox(
                  height: bodyHeight * .06,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(ExamResultScreen.routeName);

                    },
                    child: Center(
                      child: Text(
                        'Finish',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSize * 15,
                          letterSpacing: .5,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      shadowColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: bodyWidth * .001),
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top * .8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: bodyWidth * .04,
              ),
              child: SizedBox(
                height: bodyHeight * .15,
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
                      height: bodyHeight * .033,
                    ),
                    Row(
                      children: [
                        Container(
                          height: bodyHeight * .045,
                          width: bodyWidth * .3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orangeAccent,
                          ),
                          child: Center(
                            child: Text(
                              'Question: ${indQues + 1}/${sample_data.length}',
                              style: TextStyle(
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.timer_outlined,
                                color: Colors.orangeAccent,
                                size: bodyHeight * .023),
                            SizedBox(
                              width: bodyWidth * .005,
                            ),
                            GestureDetector(
                              onTap: () => getTimer(),
                              child: Text(
                                '${timeLeft}s remaining',
                                style: const TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: bodyHeight * .63,
              width: bodyWidth,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: bodyWidth * .04, vertical: bodyHeight * .025),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sample_data[indQues]['question'],
                        style: TextStyle(
                          fontSize: textSize * 17,
                          letterSpacing: .1,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight * .05,
                      ),
                      Container(
                        width: bodyWidth * .9,
                        height: bodyHeight * .08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: RadioListTile(
                          key: ValueKey('${indQues}0'),
                          groupValue:  _selectedValue.isEmpty?0 :_selectedValue[indQues],

                          value: '${sample_data[indQues]['options'][0]}',
                          onChanged: (val) {
                            setState(() {
                              _selectedValue.insert(indQues, val.toString());
                            });

                          },

                          activeColor: Theme.of(context).colorScheme.primary,
                          title: Text(
                            '${sample_data[indQues]['options'][0]}',
                            style: TextStyle(
                              fontSize: textSize * 17,
                              letterSpacing: .1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight * .03,
                      ),
                      Container(
                        width: bodyWidth * .9,
                        height: bodyHeight * .08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: RadioListTile(
                          key: ValueKey('${indQues}1'),
                          groupValue:  _selectedValue.isEmpty?0 :_selectedValue[indQues],

                          value: '${sample_data[indQues]['options'][1]}',
                          onChanged: (val) {
                            setState(() {
                              _selectedValue.insert(indQues, val.toString());
                            });
                          },

                          activeColor: Theme.of(context).colorScheme.primary,
                          title: Text(
                            '${sample_data[indQues]['options'][1]}',
                            style: TextStyle(
                              fontSize: textSize * 17,
                              letterSpacing: .1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight * .03,
                      ),
                      Container(
                        width: bodyWidth * .9,
                        height: bodyHeight * .08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: RadioListTile(
                          key: ValueKey('${indQues}2'),
                          groupValue:  _selectedValue.isEmpty?0 :_selectedValue[indQues],

                          value: '${sample_data[indQues]['options'][2]}',
                          onChanged: (val) {
                            setState(() {
                              _selectedValue.insert(indQues, val.toString());

                            });
                          },

                          activeColor: Theme.of(context).colorScheme.primary,
                          title: Text(
                            '${sample_data[indQues]['options'][2]}',
                            style: TextStyle(
                              fontSize: textSize * 17,
                              letterSpacing: .1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: bodyHeight * .03,
                      ),
                      Container(
                        width: bodyWidth * .9,
                        height: bodyHeight * .08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: RadioListTile(
                          key: ValueKey('${indQues}3'),
                          groupValue:  _selectedValue.isEmpty?0 :_selectedValue[indQues],

                          value: '${sample_data[indQues]['options'][3]}',
                          onChanged: (val) {
                            setState(() {
                              _selectedValue.insert(indQues, val.toString());

                            });
                          },

                          activeColor: Theme.of(context).colorScheme.primary,
                          title: Text(
                            '${sample_data[indQues]['options'][3]}',
                            style: TextStyle(
                              fontSize: textSize * 17,
                              letterSpacing: .1,
                              color: Colors.black,
                            ),
                          ),
                        ),
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
