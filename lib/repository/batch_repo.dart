import 'package:batch_student_starter/model/batch.dart';

import '../data_source/local_data_source/batch_data_source.dart';


abstract class BatchRepository {
  Future<List<Batch>> getBatch();
  Future<int> addBatch(Batch batch);
}

class BatchRepositoryImpl extends BatchRepository {
  @override
  Future<int> addBatch(Batch batch) {
    // TODO: implement addBatch
    return BatchDatasource().addBatch(batch);
  }

  @override
  Future<List<Batch>> getBatch() {
    // TODO: implement getbatch
    return BatchDatasource().getBatch();
  }
  
  
}
