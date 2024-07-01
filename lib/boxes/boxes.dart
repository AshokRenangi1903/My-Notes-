import 'package:hive/hive.dart';

class Boxes {
  static Box getData() {
    return Hive.box('notes-app');
  }
}
