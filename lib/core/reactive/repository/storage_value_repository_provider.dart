import 'package:myapp/core/di/inject_import.dart';
import 'package:myapp/core/reactive/repository/storage_value_repository.dart';

mixin StorageValueRepositoryProvider {
  StorageValueRepository get storagevalueRepository => injector.get<StorageValueRepository>();
}