import 'package:batch_student_starter/model/batch.dart';

import 'package:batch_student_starter/objectbox.g.dart';

import 'package:path_provider/path_provider.dart';

import '../model/student.dart';

//Box->table
//store-> database

class ObjectBoxInstance {
  late final Store _store;

  late final Box<Batch> _batch;

  late final Box<Student> _student;

  //Constructor

  ObjectBoxInstance(this._store) {
    _batch = Box<Batch>(_store);

    _student = Box<Student>(_store);

    insertBatches();
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

// batch Queries

  int addBatch(Batch batch) {
    return _batch.put(batch);
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

  void insertBatches() {
    List<Batch> lstBatches = getAllBatch();
    if (lstBatches.isEmpty) {
      addBatch(Batch('29-A'));
      addBatch(Batch('29-b'));
      addBatch(Batch('29-c'));
      addBatch(Batch('29-d'));
    }
  }
}
