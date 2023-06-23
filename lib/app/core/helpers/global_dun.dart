import 'package:intl/intl.dart';

class GlobalFunctions {
  static String formatTime(String time) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(time);

    var inputDate = DateTime.parse(tempDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String formatState(String state) {
    if(state=='waiting'){
      return 'Ready to Start';
    }else if(state=='done'){
      return 'Finished Ride';
    }else if(state=='incident'){
      return 'Not Complete';
    }else{
      return 'On the Road';
    }
  }
}
