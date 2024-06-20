import 'package:ktnotes/core/di/inject_import.dart';
import 'package:ktnotes/core/reactive/repository/storage_value_repository.dart';

mixin StorageValueRepositoryProvider {
  StorageValueRepository get storagevalueRepository => injector.get<StorageValueRepository>();
}