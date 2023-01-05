import 'package:batch_student_starter/data_source/local_data_source/student_data_source.dart';
import 'package:batch_student_starter/model/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudent();
  Future<int> addStudent(Student student);
  Future<Student?> loginStudent(String username, String Password);
}

class StudentRepositoryImpl extends StudentRepository {
  @override
  Future<int> addStudent(Student student) {
    return StudentDatasource().addStudent(student);
  }

  @override
  Future<List<Student>> getStudent() {
    return StudentDatasource().getStudent();
  }

  @override
  Future<Student?> loginStudent(String username, String password) {
    return StudentDatasource().loginStudent(username, password);
  }
}
