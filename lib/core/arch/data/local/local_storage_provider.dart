import 'package:myapp/core/arch/data/local/local_storage.dart';
import 'package:myapp/core/base/base_repository.dart';
import 'package:myapp/core/di/inject_import.dart';

mixin LocalStorageProvider on BaseRepository {
  LocalStorage get localStorage => injector.get<LocalStorage>();
}