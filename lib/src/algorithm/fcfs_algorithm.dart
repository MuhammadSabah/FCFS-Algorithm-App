class FCFS {
  //
  var processID = [];
  var burstTime = [];
  var arrivalTime = [];
  var completionTime = {};
  var turnAroundTime = {};
  var waitingTime = {};
  //
  void sortingLists() {
    int temp = 0;
    for (int i = 0; i < 4; i++) {
      for (int j = i + 1; j < 4; j++) {
        if (arrivalTime[i] > arrivalTime[j]) {
          temp = processID[i];
          processID[i] = processID[j];
          processID[j] = temp;

          temp = burstTime[i];
          burstTime[i] = burstTime[j];
          burstTime[j] = temp;

          temp = arrivalTime[i];
          arrivalTime[i] = arrivalTime[j];
          arrivalTime[j] = temp;
          //
        }
      }
    }
  }

  void calcCompletionTime() {
    completionTime[0] = burstTime[0] + arrivalTime[0];
    for (int i = 1; i < 4; i++) {
      completionTime[i] = completionTime[i - 1] + burstTime[i];
    }
  }

  void calcWaitingAndTurnAroundTime() {
    for (int i = 0; i < 4; i++) {
      turnAroundTime[i] = completionTime[i] - arrivalTime[i];
      waitingTime[i] = turnAroundTime[i] - burstTime[i];
    }
  }
}
