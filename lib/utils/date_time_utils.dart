import 'package:intl/intl.dart';

class DateTimeUtil {
  static String fromTimeStamp(int timeStamp) {
    var now = DateTime.now();
    DateFormat();
    var date = DateTime.fromMicrosecondsSinceEpoch(timeStamp * 1000);
    var diff = date.difference(now);
    var time = '';
    if (diff.inDays.abs() == 1) {
      time = diff.inDays.abs().toString() + ' day ago';
    } else if (diff.inDays.abs() > 1) {
      time = diff.inDays.abs().toString() + ' days ago';
    } else if (diff.inHours.abs() == 1) {
      time = diff.inHours.abs().toString() + ' hour ago';
    }else if (diff.inHours.abs() > 1) {
      time = diff.inHours.abs().toString() + ' hours ago';
    } else if (diff.inMinutes.abs() == 1) {
      time = diff.inMinutes.abs().toString() + ' minute ago';
    }else if (diff.inMinutes.abs() > 1) {
      time = diff.inMinutes.abs().toString() + ' minutes ago';
    } else{
      time = "A moment ago";
    }
    return time;
  }
}
