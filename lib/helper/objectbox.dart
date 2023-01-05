import 'package:batch_student_starter/model/batch.dart';
import 'package:batch_student_starter/model/course.dart';
import 'package:batch_student_starter/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import '../model/student.dart';

//Box->table
//store-> database

class ObjectBoxInstance {
  late final Store _store;

  late final Box<Batch> _batch;

  late final Box<Student> _student;
  late final Box<Course> _course;

  //Constructor

  ObjectBoxInstance(this._store) {
    _batch = Box<Batch>(_store);

    _student = Box<Student>(_store);
    _course = Box<Course>(_store);

    insertBatches();
    insertCourses();
  }

// Initialization of ObjectBox

  static Future<ObjectBoxInstance> init() async {
    
    var dir = await getApplicationDocumentsDirectory();

    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/student_course',
    );

    return ObjectBoxInstance(store);
  }
  // Delete Store and all box

// batch Queries

  int addBatch(Batch batch) {
    return _batch.put(batch);
  }

  int addCourses(Course course) {
    return _course.put(course);
  }

  List<Course> getAllCourses() {
    return _course.getAll();
  }

  List<Batch> getAllBatch() {
    return _batch.getAll();
  }

  int addStudent(Student student) {
    return _student.put(student);
  }

  List<Student> getAllStudent() {
    return _student.getAll();
  }
   //Login student
  Student? loginStudent(String username, String password) {
    return _student
        .query(Student_.username.equals(username) &
            Student_.password.equals(password))
        .build()
        .findFirst();
  }

  void insertBatches() {
    List<Batch> lstBatches = getAllBatch();
    if (lstBatches.isEmpty) {
      addBatch(Batch('29-A'));
      addBatch(Batch('29-b'));
      addBatch(Batch('29-c'));
      addBatch(Batch('29-d'));
    }
  }

  void insertCourses() {
    List<Course> lstcourse = getAllCourses();
    if (lstcourse.isEmpty) {
      addCourses(Course("java"));
      addCourses(Course("python"));
      addCourses(Course("python"));
      addCourses(Course("python"));
    }
  }

 
}
