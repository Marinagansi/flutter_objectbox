import 'package:batch_student_starter/repository/student_repo.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../data_source/local_data_source/batch_data_source.dart';
import '../model/batch.dart';
import '../model/student.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   List<Batch> _lstBatches = [];
  String _dropDownValue = "";

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'Rana');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  @override
  void initState() {
    getBatches();
    super.initState();
  }

  getBatches() async {
    _lstBatches= await BatchDatasource().getBatch();
  }

  _savestudent() async {
    Student student = Student(
      _fnameController.text,
      _lnameController.text,
      _usernameController.text,
      _passwordController.text,
    );
    final batch = _lstBatches
        .firstWhere((element) => element.batchName == _dropDownValue);

    student.batch.target = batch;
    int status = await StudentRepositoryImpl().addStudent(student);
    _showMessage(status);
  }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text("successful"),
      ).show(context);
    } else {
      MotionToast.error(
        description: const Text('error'),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FutureBuilder(
                    future: BatchDatasource().getBatch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select batch';
                            }
                            return null;
                          },
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: 'Select Batch',
                          ),
                          items: _lstBatches
                              .map((batch) => DropdownMenuItem(
                                    value: batch.batchName,
                                    child: Text(batch.batchName),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            _dropDownValue = value!;
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _savestudent();
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Brand Bold",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
