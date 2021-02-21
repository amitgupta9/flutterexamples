import '../export/export.dart';

Widget getSuccessSnackBar(String message) {
  return SnackBar(
    duration: Duration(seconds: 1),
    content: Center(
      heightFactor: 1.0,
      child: Text(
        '$message',
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
    ),
    backgroundColor: Colors.green,
  );
}

Widget getErrorSnackBar(String message) {
  return SnackBar(
    duration: Duration(seconds: 1),
    content: Center(
      heightFactor: 1.0,
      child: Text(
        '$message',
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
    ),
    backgroundColor: Colors.red,
  );
}
