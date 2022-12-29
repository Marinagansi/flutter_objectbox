import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/student.dart';
import 'package:batch_student_starter/state/objectbox_state.dart';

class StudentDatasource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  //or
  //ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addStudent(Student student) async {
    try {
      return objectBoxInstance.addStudent(student);
    } catch (e) {
      return Future.value(0);
      //or
      //return 0;
    }
  }

  Future<List<Student>>getStudent() async {
    try {
      return objectBoxInstance.getAllStudent();
    } catch (e) {
      throw Exception("error in getting all student");
      //or
      //return 0;
    }
  }

   
}
