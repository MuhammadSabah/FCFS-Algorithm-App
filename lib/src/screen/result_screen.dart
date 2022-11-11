
import 'package:fcfs_algorithm/src/algorithm/fcfs_algorithm.dart';
import 'package:fcfs_algorithm/src/screen/home_screen.dart';
import 'package:fcfs_algorithm/src/widget/text_title.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({
    Key? key,
    @required this.returnWT1,
    @required this.returnWT2,
    @required this.returnWT3,
    @required this.returnWT4,
    @required this.process1,
    @required this.process2,
    @required this.process3,
    @required this.process4,
    @required this.returnTA1,
    @required this.returnTA2,
    @required this.returnTA3,
    @required this.returnTA4,
    // @required this.averageWaitingTime,
    // @required this.averageTurnAroundTime,
  }) : super(key: key);
  var process1;
  var process2;
  var process3;
  var process4;
  //
  var returnWT1;
  var returnWT2;
  var returnWT3;
  var returnWT4;
  //
  var returnTA1;
  var returnTA2;
  var returnTA3;
  var returnTA4;
  //
  var averageWaitingTime;
  var averageTurnAroundTime;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  FCFS fcfsClass = FCFS();

  void clearAll() {
    setState(() {
      fcfsClass.completionTime.clear();
      fcfsClass.waitingTime.clear();
      fcfsClass.turnAroundTime.clear();
      fcfsClass.burstTime.clear();
      fcfsClass.arrivalTime.clear();
      fcfsClass.processID.clear();

      widget.process1 = 0;
      widget.process2 = 0;
      widget.process3 = 0;
      widget.process4 = 0;

      widget.returnWT1 = 0;
      widget.returnWT2 = 0;
      widget.returnWT3 = 0;
      widget.returnWT4 = 0;

      widget.returnTA1 = 0;
      widget.returnTA2 = 0;
      widget.returnTA3 = 0;
      widget.returnTA4 = 0;

      widget.averageWaitingTime = 0;
      widget.averageTurnAroundTime = 0;
    });
  }

  //
  dynamic getAverageWT() {
    widget.averageWaitingTime = (widget.returnWT1 +
            widget.returnWT2 +
            widget.returnWT3 +
            widget.returnWT4) /
        4;
    return widget.averageWaitingTime;
  }

  dynamic getAverageTA() {
    widget.averageTurnAroundTime = (widget.returnTA1 +
            widget.returnTA2 +
            widget.returnTA3 +
            widget.returnTA4) /
        4;
    return widget.averageTurnAroundTime;
  }

  //
  @override
  Widget build(BuildContext context) {
    var returnAvgWT = getAverageWT();
    var returnAvgTA = getAverageTA();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
          clearAll();
        },
        icon: const Icon(Icons.arrow_back),
        label: const Text(
          "Return",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Scheduling Result',
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Waiting Time:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ProcessText(
                          text:
                              "P${widget.process1.toString()}: ${widget.returnWT1.toString()}"),
                      ProcessText(
                          text:
                              "P${widget.process2.toString()}: ${widget.returnWT2.toString()}"),
                      ProcessText(
                          text:
                              "P${widget.process3.toString()}: ${widget.returnWT3.toString()}"),
                      ProcessText(
                          text:
                              "P${widget.process4.toString()}: ${widget.returnWT4.toString()}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Turn Around Time:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ProcessText(
                          text:
                              "P${widget.process1.toString()}: ${widget.returnTA1.toString()}"),
                      ProcessText(
                          text:
                              "P${widget.process2.toString()}: ${widget.returnTA2.toString()}"),
                      ProcessText(
                          text:
                              "P${widget.process3.toString()}: ${widget.returnTA3.toString()}"),
                      ProcessText(
                          text:
                              "P${widget.process4.toString()}: ${widget.returnTA4.toString()}"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        'Avg. Waiting Time: ${widget.averageWaitingTime.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Avg. Turn Around Time: ${widget.averageTurnAroundTime.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
    );
  }
}
