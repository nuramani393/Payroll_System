/*
import 'dart:io';

// NIK NURUL_1911480
void main() {
  // Create an empty List to store the employee's working hours
 List<int?> workingHours = List.filled(22, null);

  // Ask the employee to input their working hours for each slot
  for (int i = 0; i < 22; i++) {
    print('Enter working hours for slot #${i+1}:');
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      int hours = int.parse(input);
      workingHours[i] = hours;
    }
  }

}

import 'dart:io';

void main() {
  // Create an empty List to store the employee's working hours and datetime
  List<Map<String, dynamic>> employeeData = List.filled(22, {});

  // Ask the employee to input their working hours and datetime for each slot
  for (int i = 0; i < 22; i++) {
    print('Enter working hours for slot #${i + 1}:');
    String? inputHours = stdin.readLineSync();

    print('Enter date and time for slot #${i + 1} (yyyy-mm-dd HH:mm:ss):');
    String? inputDatetime = stdin.readLineSync();

    if (inputHours != null && inputHours.isNotEmpty) {
      int hours = int.parse(inputHours);
      employeeData[i]['hours'] = hours;
    }

    if (inputDatetime != null && inputDatetime.isNotEmpty) {
      employeeData[i]['datetime'] = inputDatetime;
    }
  }
}

====================================================================================

*/
import 'dart:io';
import 'dart:math';

void main() {
  // Create an empty list to store the employee's working hours and datetime
  List<Map<String, dynamic>> employeeData = [];

  // Ask the user to input working hours and datetime for each slot
  for (int i = 1; i <= 22; i++) {
    print('Enter working hours for slot #$i:');
    int hours = int.parse(stdin.readLineSync()!);

    print('Enter date and time for slot #$i (yyyy-mm-dd HH:mm:ss):');
    String datetimeString = stdin.readLineSync()!;
    DateTime datetime = DateTime.parse(datetimeString);

    // Store the input data in a map and add it to the list
    Map<String, dynamic> data = {
      'hours': hours,
      'datetime': datetime,
    };
    employeeData.add(data);
  }

  // Calculate the pay and EPF for each employee and display the details
  for (int i = 0; i < employeeData.length; i++) {
    // Exclude weekends from the calculation
    if (_isWeekday(employeeData[i]['datetime'])) {
      // Calculate the start time if the employee arrived late to work
      int startHour = 8;
      if (employeeData[i]['datetime'].hour > 8) {
        startHour = employeeData[i]['datetime'].hour;
      }

      // Calculate the total working hours and the pay
      int totalHours = max(0, employeeData[i]['hours'] - (startHour - 9));
      double pay = totalHours * 6;

      // Calculate the EPF
      double epf = pay * 0.11;

      // Display the details
      print('Slot #${i + 1}:');
      print('Working hours: ${employeeData[i]['hours']}');
      print('Date and time: ${employeeData[i]['datetime']}');
      print('Total working hours: $totalHours');
      print('Pay: RM $pay');
      print('EPF: RM ${epf.toStringAsFixed(2)}');
      print('');
    }
  }
}

// Check if a given date is a weekday (Monday - Friday)
bool _isWeekday(DateTime date) {
  return date.weekday >= 1 && date.weekday <= 5;
}
