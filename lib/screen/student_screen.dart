import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/model/student_model.dart';
import 'package:student_provider/provider/student_provider.dart';

class StudentDemo extends StatefulWidget {
  const StudentDemo({super.key});

  @override
  State<StudentDemo> createState() => _StudentDemoState();
}

class _StudentDemoState extends State<StudentDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: context.read<Student1Provider>().txtNameController),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: context.read<Student1Provider>().txtAddressController,
            ),
            MaterialButton(
                onPressed: () {
                  context.read<Student1Provider>().add();
                },
                child: Selector<Student1Provider, bool>(
                  builder: (context, value, child) => value == false
                      ? const Text('Submit')
                      : const Text('Update'),
                  selector: (context, obj) => obj.isedit,
                  shouldRebuild: (previous, next) =>
                      next == true || previous == false,
                )),

            Expanded(
              child: Selector<Student1Provider, List<Student>>(
                  shouldRebuild: (previous, next) => previous.isNotEmpty,
                  selector: (context, obj) => obj.student1data,
                  builder: (context, value, child) => ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              height: 50,
                              width: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(value[index].name),
                                  Text(value[index].address),
                                ],
                              ),
                            ),
                            onTap: () {
                              context.read<Student1Provider>().Indexdata =
                                  index;
                              context
                                  .read<Student1Provider>()
                                  .txtNameController
                                  .text = value[index].name;
                              context
                                  .read<Student1Provider>()
                                  .txtAddressController
                                  .text = value[index].address;
                              context
                                  .read<Student1Provider>()
                                  .update(); // ignore: avoid_print
                              // ignore: avoid_print
                              print(Student1Provider());
                            },
                          ),
                        ),
                        itemCount: value.length,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
