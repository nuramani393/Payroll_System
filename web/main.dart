import 'dart:html';
//import 'dart:ui';

void main() {
  // declare growable list

  // Get the form element and submit button
  var form = querySelector('form');

  //list of map
  List<Map<String, String>> dataList = [];

  // Create a data object with the input values
  Map<String, String> data = {
    'date': '',
    'start': '',
    'end': '',
    'duration': '',
    'payment': ''
  };

  form!.onSubmit.listen((event) {
    // Prevent the form from submitting
    event.preventDefault();

    // Get the input values
    var dateValue = querySelector('#start-date') as InputElement;
    var startTimeValue = querySelector('#start-time') as InputElement;
    var endTimeValue = querySelector('#end-time') as InputElement;

    data['date'] = dateValue.value!;
    data['start'] = startTimeValue.value!;
    data['end'] = endTimeValue.value!;

    //Calculation to get duration of working hours
    DateTime startTime = DateTime.parse('1970-01-01 ${data['start']}:00');
    DateTime endTime = DateTime.parse('1970-01-01 ${data['end']}:00');
    Duration duration = endTime.difference(startTime);
    String durationStr = (duration.inSeconds / 3600).toStringAsFixed(2);
    data['duration'] = durationStr;

    //Calculation payment per day
    // double paymentperday = double.parse(durationStr) * 6;
    // data['payment'] = paymentperday.toString();

    dataList.add(data);

    // Get the table body element
    var table = querySelector('#WorkingHours') as TableSectionElement;
    var newRow = table.insertRow(-1); // -1 means "insert at the end"
    newRow.insertCell(0).text = data['date']!;
    newRow.insertCell(1).text = data['start']!;
    newRow.insertCell(2).text = data['end']!;
    newRow.insertCell(3).text = data['duration']!;
    // newRow.insertCell(4).text = data['payment']!;
  });

  //Calculation

  var buttonCalc = querySelector('#calcbutton') as ButtonElement;

  buttonCalc.onClick.listen((event) {
    // var table = querySelector('#calc') as TableSectionElement;
    //
    //   var newRow = table.insertRow(-1);
    //   newRow.insertCell(0).text = data[''];
    //   newRow.insertCell(1).text = data['start'];
    //   newRow.insertCell(2).text = data['end'];
    // }
  });

  // var outputDiv = querySelector('#output') as OutputElement;
}
