import 'package:intl/intl.dart';

class TransitionClass {
  static List<Map<String, String>> transition = [
    {
      "transition": "150000",
      "type": "1",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "150000",
      "type": "1",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "15000000",
      "type": "1",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "150000000",
      "type": "1",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "150000000",
      "type": "1",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "2000000",
      "type": "0",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "1500000",
      "type": "1",
      "operation": "07737446118",
      "date": "2023/2/25"
    },
    {
      "transition": "15000000",
      "type": "0",
      "operation": "07702608833",
      "date": "2023/2/25"
    },
  ];

  static convert(String number) {
    int numbers = int.parse(number);
    final formatter = NumberFormat('#,###');
    final formattedNumber = formatter.format(numbers);
    return formattedNumber;
  }

  static Future gettransition() async {
    return transition;
  }
}
