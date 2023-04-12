import 'package:flutter/material.dart';
import 'package:student_provider/model/student_model.dart';

class Student1Provider extends ChangeNotifier {
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtAddressController = TextEditingController();
  TextEditingController txtEditController = TextEditingController();
  bool isedit = false;
  String name = '';
  // ignore: non_constant_identifier_names
  int Indexdata = -1;

  List<Student> student1data = [];

  void add() {
    if (isedit == false) {
      student1data.add(Student(
          name: txtNameController.text, address: txtAddressController.text));
    } else {
      student1data[Indexdata].name = txtNameController.text;
      student1data[Indexdata].address = txtAddressController.text;
    }

    txtNameController.clear();
    txtAddressController.clear();

    changestate();
  }

  void update() {
    isedit = true;
    txtNameController.text;
    txtAddressController.text;
    // txtEditController.text;
    changestate();
  }

  void changestate() => notifyListeners();
}
