/*
NUR AMANINA 2011402
NUR ATHIRAH 2011156
NIK NURUL FAKHRIWANI 1911480 
*/
import 'dart:html';

void main() {
  // Get the form element and submit button
  var form = querySelector('form');

  // List of maps
  List<Map<String, String>> dataList = [];

  double salary = 0;
  double totalduration = 0;
  double epf = 0;
  double netsalary = 0;

  // Submit event listener
  form!.onSubmit.listen((event) {
    // Prevent the form from submitting
    event.preventDefault();

    // Get the input values
    var dateValue = querySelector('#start-date') as InputElement;
    var startTimeValue = querySelector('#start-time') as InputElement;
    var endTimeValue = querySelector('#end-time') as InputElement;

    // Create a new data object with the input values
    Map<String, String> data = {
      'date': dateValue.value!,
      'start': startTimeValue.value!,
      'end': endTimeValue.value!,
      'duration': '',
      'payment': ''
    };

    // Calculation to get duration of working hours
    DateTime startTime = DateTime.parse('1970-01-01 ${data['start']}:00');
    DateTime endTime = DateTime.parse('1970-01-01 ${data['end']}:00');
    Duration duration = endTime.difference(startTime);
    String durationStr = (duration.inSeconds / 3600).toStringAsFixed(2);
    data['duration'] = durationStr;

    // Calculation payment per day
    double paymentperday = double.parse(durationStr) * 6;
    data['payment'] = paymentperday.toString();

    // Add map to list
    dataList.add(data);

    // Get the table body element and display map
    var table = querySelector('#WorkingHours') as TableSectionElement;
    var newRow = table.insertRow(-1); // -1 means "insert at the end"
    newRow.insertCell(0).text = data['date']!;
    newRow.insertCell(1).text = data['start']!;
    newRow.insertCell(2).text = data['end']!;
    newRow.insertCell(3).text = data['duration']!;
    newRow.insertCell(4).text = data['payment']!;
  });

  // Calculation event listener
  var buttonCalc = querySelector('#calcbutton') as ButtonElement;

  buttonCalc.onClick.listen((event) {
    for (var data in dataList) {
      salary += double.parse(data['payment']!);
      totalduration += double.parse(data['duration']!);
    }

    epf = salary * 0.11;
    netsalary = salary - epf;

    var table = querySelector('#calc') as TableSectionElement;
    var newRow = table.insertRow(-1);
    newRow.insertCell(0).text = totalduration.toString();
    newRow.insertCell(1).text = salary.toString();
    newRow.insertCell(2).text = epf.toString();
    newRow.insertCell(3).text = netsalary.toString();
  });
}
