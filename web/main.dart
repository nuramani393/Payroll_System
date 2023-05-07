// import 'dart:html';

// void main() {
//   querySelector('#output')?.text = 'Your Dart app is running.';
// }

import 'dart:html';

void main() {
  // Initialize list with 22 empty slots
  List<int> workingHours = List.filled(22, 0);

  // Get HTML elements
  InputElement employeeName = querySelector('#employee-name') as InputElement;
  InputElement idNumber = querySelector('#id') as InputElement;
  InputElement workingHoursInput =
      querySelector('#working-hours') as InputElement;
  InputElement startDate = querySelector('#start-date') as InputElement;
  InputElement startTime = querySelector('#start-time') as InputElement;
  InputElement endTime = querySelector('#end-time') as InputElement;
  ButtonElement calculatePayButton =
      querySelector('input[type="submit"]') as ButtonElement;
  TableElement employeeTable = querySelector('#employeeTable') as TableElement;

  // Add event listener for calculate pay button
  calculatePayButton.onClick.listen((MouseEvent event) {
    event.preventDefault(); // prevent form from submitting

    // Get input values
    String? name = employeeName.value;
    String? id = idNumber.value;
    int hours = int.parse(workingHoursInput.value!);
    String date = startDate.value!;
    String start = startTime.value!;
    String end = endTime.value!;

    // Calculate hours worked
    int startHour = int.parse(start.split(':')[0]);
    int startMinute = int.parse(start.split(':')[1]);
    int endHour = int.parse(end.split(':')[0]);
    int endMinute = int.parse(end.split(':')[1]);

    int minutesWorked =
        (endHour * 60 + endMinute) - (startHour * 60 + startMinute);
    int hoursWorked = minutesWorked ~/ 60;

    // Update working hours list
    int index = getEmptySlotIndex(workingHours);
    if (index != -1) {
      workingHours[index] = hoursWorked;
    }

    // Calculate payable amount and EPF contribution
    double payableAmount = hoursWorked * 6;
    double epfContribution = payableAmount * 0.11;

    // Add row to employee table
    TableRowElement row = employeeTable.tBodies.first!.insertRow(-1);
    TableCellElement nameCell = row.insertCell(-1)..text = name;
    TableCellElement idCell = row.insertCell(-1)..text = id;
    TableCellElement dateCell = row.insertCell(-1)..text = date;
    TableCellElement hoursWorkedCell = row.insertCell(-1)
      ..text = hoursWorked.toString();
    TableCellElement payableAmountCell = row.insertCell(-1)
      ..text = 'RM ' + payableAmount.toStringAsFixed(2);
    TableCellElement epfContributionCell = row.insertCell(-1)
      ..text = 'RM ' + epfContribution.toStringAsFixed(2);
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
