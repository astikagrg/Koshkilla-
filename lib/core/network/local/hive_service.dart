import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../../config/constants/hive_table_constant.dart';
import '../../../features/auth/data/model/user_hive_model.dart';

final hiveServiceProvider = Provider(
  (ref) => HiveService(),
);

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    //register adapters
    Hive.registerAdapter(UserHiveModelAdapter());
  }
}
