import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/course.dart';
import 'package:batch_student_starter/state/objectbox_state.dart';

class CourseDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addCourse(Course course) async{
    try {
      return objectBoxInstance.addCourses(course);
    } catch (e) {
      return Future.value(0);
      //or
      //return 0;
    }
  }
  Future<List<Course>>getCourse() async {
    try {
      return objectBoxInstance.getAllCourses();
    } catch (e) {
      throw Exception("error in getting all student");
      //or
      //return 0;
    }
  }
}
