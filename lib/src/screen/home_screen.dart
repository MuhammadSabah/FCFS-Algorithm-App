import 'package:fcfs_algorithm/src/algorithm/fcfs_algorithm.dart';
import 'package:fcfs_algorithm/src/screen/result_screen.dart';
import 'package:fcfs_algorithm/src/widget/bottom_button.dart';
import 'package:fcfs_algorithm/src/widget/text_field.dart';
import 'package:fcfs_algorithm/src/widget/text_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var burstFirstController = TextEditingController();
  var burstSecondController = TextEditingController();
  var burstThirdController = TextEditingController();
  var burstFourthController = TextEditingController();
  //
  var arrivalFirstController = TextEditingController();
  var arrivalSecondController = TextEditingController();
  var arrivalThirdController = TextEditingController();
  var arrivalFourthController = TextEditingController();
  //
  int processID1 = 1;
  int processID2 = 2;
  int processID3 = 3;
  int processID4 = 4;
  //
  late String burstVal1;
  late String burstVal2;
  late String burstVal3;
  late String burstVal4;
  // ****
  late int burst1 = int.parse(burstVal1);
  late int burst2 = int.parse(burstVal2);
  late int burst3 = int.parse(burstVal3);
  late int burst4 = int.parse(burstVal4);
  //
  late String arrivalVal1;
  late String arrivalVal2;
  late String arrivalVal3;
  late String arrivalVal4;
  // ****
  late int arrival1 = int.parse(arrivalVal1);
  late int arrival2 = int.parse(arrivalVal2);
  late int arrival3 = int.parse(arrivalVal3);
  late int arrival4 = int.parse(arrivalVal4);
  //??$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  late int sortP1;
  late int sortP2;
  late int sortP3;
  late int sortP4;
  //
  late int waitingTime1;
  late int waitingTime2;
  late int waitingTime3;
  late int waitingTime4;
  //
  late int turnAroundTime1;
  late int turnAroundTime2;
  late int turnAroundTime3;
  late int turnAroundTime4;
  //
  late double avgWT;
  late double avgTA;
  //
  FCFS fcfsClass = FCFS();
  //
  void getResultFunction() {
    setState(() {
      if (burstFirstController.text.isEmpty ||
          burstSecondController.text.isEmpty ||
          burstThirdController.text.isEmpty ||
          burstFourthController.text.isEmpty ||
          arrivalFirstController.text.isEmpty ||
          arrivalSecondController.text.isEmpty ||
          arrivalThirdController.text.isEmpty ||
          arrivalFourthController.text.isEmpty) {
        return;
      } else {
        fcfsClass.burstTime.add(burst1);
        fcfsClass.burstTime.add(burst2);
        fcfsClass.burstTime.add(burst3);
        fcfsClass.burstTime.add(burst4);
        //
        fcfsClass.arrivalTime.add(arrival1);
        fcfsClass.arrivalTime.add(arrival2);
        fcfsClass.arrivalTime.add(arrival3);
        fcfsClass.arrivalTime.add(arrival4);
        //
        fcfsClass.processID.add(processID1);
        fcfsClass.processID.add(processID2);
        fcfsClass.processID.add(processID3);
        fcfsClass.processID.add(processID4);
        //
        fcfsClass.sortingLists();
        fcfsClass.calcCompletionTime();
        fcfsClass.calcWaitingAndTurnAroundTime();
        //
        sortP1 = fcfsClass.processID[0];
        sortP2 = fcfsClass.processID[1];
        sortP3 = fcfsClass.processID[2];
        sortP4 = fcfsClass.processID[3];
        //
        waitingTime1 = fcfsClass.waitingTime[0];
        waitingTime2 = fcfsClass.waitingTime[1];
        waitingTime3 = fcfsClass.waitingTime[2];
        waitingTime4 = fcfsClass.waitingTime[3];
        //
        turnAroundTime1 = fcfsClass.turnAroundTime[0];
        turnAroundTime2 = fcfsClass.turnAroundTime[1];
        turnAroundTime3 = fcfsClass.turnAroundTime[2];
        turnAroundTime4 = fcfsClass.turnAroundTime[3];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              process1: sortP1,
              process2: sortP2,
              process3: sortP3,
              process4: sortP4,
              returnWT1: waitingTime1,
              returnWT2: waitingTime2,
              returnWT3: waitingTime3,
              returnWT4: waitingTime4,
              returnTA1: turnAroundTime1,
              returnTA2: turnAroundTime2,
              returnTA3: turnAroundTime3,
              returnTA4: turnAroundTime4,
            ),
          ),
        );
        sortP1;
        sortP2;
        sortP3;
        sortP4;
        waitingTime1;
        waitingTime2;
        waitingTime3;
        waitingTime4;
        turnAroundTime1;
        turnAroundTime2;
        turnAroundTime3;
        turnAroundTime4;

        fcfsClass.completionTime.clear();
        fcfsClass.waitingTime.clear();
        fcfsClass.turnAroundTime.clear();
        fcfsClass.processID.clear();
      }
    });
  }

  void clearField() {
    setState(() {
      burstFirstController.clear();
      burstSecondController.clear();
      burstThirdController.clear();
      burstFourthController.clear();
      arrivalFirstController.clear();
      arrivalSecondController.clear();
      arrivalThirdController.clear();
      arrivalFourthController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              setState(() {
                clearField();
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.green,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'FCFS Algorithm',
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      TitleText(
                        description: "Processes",
                      ),
                      TitleText(
                        description: "Burst Time",
                      ),
                      TitleText(
                        description: "Arrival Time",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          ProcessText(text: 'P${processID1.toString()}'),
                          const SizedBox(height: 27),
                          ProcessText(text: 'P${processID2.toString()}'),
                          const SizedBox(height: 27),
                          ProcessText(text: 'P${processID3.toString()}'),
                          const SizedBox(height: 27),
                          ProcessText(text: 'P${processID4.toString()}'),
                        ],
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            NumberField(
                              textFieldController: burstFirstController,
                              onChanged: (value) {
                                setState(() {
                                  burstVal1 = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            NumberField(
                              textFieldController: burstSecondController,
                              onChanged: (value) {
                                setState(() {
                                  burstVal2 = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            NumberField(
                              textFieldController: burstThirdController,
                              onChanged: (value) {
                                setState(() {
                                  burstVal3 = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            NumberField(
                              textFieldController: burstFourthController,
                              onChanged: (value) {
                                setState(() {
                                  burstVal4 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            NumberField(
                              textFieldController: arrivalFirstController,
                              onChanged: (value) {
                                setState(() {
                                  arrivalVal1 = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            NumberField(
                              textFieldController: arrivalSecondController,
                              onChanged: (value) {
                                setState(() {
                                  arrivalVal2 = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            NumberField(
                              textFieldController: arrivalThirdController,
                              onChanged: (value) {
                                setState(() {
                                  arrivalVal3 = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            NumberField(
                              textFieldController: arrivalFourthController,
                              onChanged: (value) {
                                setState(() {
                                  arrivalVal4 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: getResultFunction,
                    child: const ButtonResult(
                      title: 'Get Result',
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
