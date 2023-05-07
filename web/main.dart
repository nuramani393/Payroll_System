import 'dart:html';

void main() {
  // Initialize list with 22 empty slots
  List<int> hoursWorked = List.filled(22, 0);

  // Get HTML elements
  DateInputElement startDate = querySelector('#start-date') as DateInputElement;
  TimeInputElement startTime = querySelector('#start-time') as TimeInputElement;
  TimeInputElement endTime = querySelector('#end-time') as TimeInputElement;
  ButtonElement saveButton =
      querySelector('input[type="submit"]') as ButtonElement;

  TableElement workingHours = querySelector('#employeeTable') as TableElement;

  // Add event listener for calculate pay button
  saveButton.onClick.listen((MouseEvent event) {
    event.preventDefault(); // prevent form from submitting

    // Get input values
    String date = startDate.value!;
    String start = startTime.value!;
    String end = endTime.value!;

    // // Save the input values to localStorage
    // window.localStorage['date'] = date;
    // window.localStorage['start'] = start;
    // window.localStorage['end'] = end;

    // Calculate hours worked
    int startHour = int.parse(start.split(':')[0]);
    int startMinute = int.parse(start.split(':')[1]);
    int endHour = int.parse(end.split(':')[0]);
    int endMinute = int.parse(end.split(':')[1]);

    int minutesWorked =
        (endHour * 60 + endMinute) - (startHour * 60 + startMinute);
    int hoursWorking = minutesWorked ~/ 60;

    // // Update working hours list
    // int index = getEmptySlotIndex(hoursWorked);
    // if (index != -1) {
    //   hoursWorked[index] = hoursWorking;
    // }

    // Calculate payable amount and EPF contribution
    double payableAmount = hoursWorking * 6;
    // double epfContribution = payableAmount * 0.11;

    var displayElement = querySelector('#output');
    displayElement?.text = "Payable Amount: RM$payableAmount";

    // // Add row to employee table
    // TableRowElement row = workingHours.tBodies.first!.insertRow(-1);
    // TableCellElement dateCell = row.insertCell(-1)..text = date;
    // TableCellElement hoursWorkedCell = row.insertCell(-1)
    //   ..text = hoursWorked.toString();
    // TableCellElement payableAmountCell = row.insertCell(-1)
    //   ..text = 'RM ' + payableAmount.toStringAsFixed(2);
    // TableCellElement epfContributionCell = row.insertCell(-1)
    //   ..text = 'RM ' + epfContribution.toStringAsFixed(2);
  });
}

// Helper function to get index of first empty slot in working hours list
int getEmptySlotIndex(List<int> workingHours) {
  for (int i = 0; i < workingHours.length; i++) {
    if (workingHours[i] == 0) {
      return i;
    }
  }
  return -1;
}
