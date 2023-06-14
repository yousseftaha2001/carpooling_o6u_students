import 'package:intl/intl.dart';

class GlobalFunctions{
 static String formatTime(String time){
   DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(time);

    var inputDate = DateTime.parse(tempDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}