import 'package:ktnotes/core/arch/data/local/local_storage.dart';
import 'package:ktnotes/core/base/base_repository.dart';
import 'package:ktnotes/core/di/inject_import.dart';

mixin LocalStorageProvider on BaseRepository {
  LocalStorage get localStorage => injector.get<LocalStorage>();
}