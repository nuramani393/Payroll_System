import 'dart:html';

void main() {
  // Initialize list with 22 empty slots
  // List<int> hoursWorked = List.filled(22, 0);

  // Get the form element and submit button
  var form = querySelector('form');
  form!.onSubmit.listen((event) {
    // Prevent the form from submitting
    event.preventDefault();

    // Get the input values
    var dateValue = (querySelector('#start-date') as InputElement).value;
    var startTimeValue = (querySelector('#start-time') as InputElement).value;
    var endTimeValue = (querySelector('#end-time') as InputElement).value;

    // // Create a data object with the input values
    // Map<String, String> data = {
    //   'date': dateValue!,
    //   'start-time': startTimeValue!,
    //   'end-time': endTimeValue!
    // };

    // Get the table body element
    var table = querySelector('#WorkingHours') as TableSectionElement;
    var newRow = table.insertRow(-1); // -1 means "insert at the end"
    newRow.insertCell(0).text = dateValue;
    newRow.insertCell(1).text = startTimeValue;
    newRow.insertCell(2).text = endTimeValue;
  });
}
    

// Function to calculate hours worked from start time and end time
// double calculateHoursWorked(String startTime, String endTime) {
//   var start = DateTime.parse("2023-01-01 " + startTime);
//   var end = DateTime.parse("2023-01-01 " + endTime);
//   var duration = end.difference(start);
//   return duration.inMinutes / 60.0;
// }

// Function to calculate payable amount from hours worked
// double calculatePayableAmount(double hoursWorked) {
//   return hoursWorked * 10.0; // Assuming $10 per hour
// }


    // Calculate hours worked
    // int startHour = int.parse(start!.split(':')[0]);
    // int startMinute = int.parse(start.split(':')[1]);
    // int endHour = int.parse(end!.split(':')[0]);
    // int endMinute = int.parse(end.split(':')[1]);

    // int minutesWorked =
    //     (endHour * 60 + endMinute) - (startHour * 60 + startMinute);
    // int hoursWorking = minutesWorked ~/ 60;

    // // Update working hours list
    // int index = getEmptySlotIndex(hoursWorked);
    // if (index != -1) {
    //   hoursWorked[index] = hoursWorking;
    // }

    // Calculate payable amount and EPF contribution
    // double payableAmount = hoursWorking * 6;
    // // double epfContribution = payableAmount * 0.11;


    // // Add row to employee table
    // TableRowElement row = workingHours.tBodies.first!.insertRow(-1);
    // TableCellElement dateCell = row.insertCell(-1)..text = date;
    // TableCellElement hoursWorkedCell = row.insertCell(-1)
    //   ..text = hoursWorked.toString();
    // TableCellElement payableAmountCell = row.insertCell(-1)
    //   ..text = 'RM ' + payableAmount.toStringAsFixed(2);
    // TableCellElement epfContributionCell = row.insertCell(-1)
    //   ..text = 'RM ' + epfContribution.toStringAsFixed(2);
  

