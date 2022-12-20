//flutter pub run build_runner build  --delete-conflicting-outputs

import 'package:objectbox/objectbox.dart';

@Entity()
class Batch {
  @Id(assignable: true)
  int batchId;
  String batchName;

  Batch(this.batchName, {this.batchId = 0});
}
