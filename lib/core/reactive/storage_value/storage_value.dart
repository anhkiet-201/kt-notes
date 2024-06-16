// ignore_for_file: library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:myapp/core/arch/data/local/local_storage.dart';
import 'package:myapp/core/base/base_store.dart';
import 'package:myapp/core/logger/logger.dart';
import 'package:myapp/core/reactive/abstract_value/abstract_value.dart';
import 'package:myapp/core/reactive/repository/storage_value_repository_provider.dart';
part 'storage_value.g.dart';

class StorageValue<T> = _StorageValueBase<T> with _$StorageValue<T>;

abstract class _StorageValueBase<T> extends BaseStore
    with Store, StorageValueRepositoryProvider {
  final LocalStorageKey<T> key;

  @observable
  T _value;

  @computed
  T get value => _value;

  @action
  Future<void> updateValue(T? newValue) async {
    final previousValue = _value;
    try {
      if (newValue is AbstractValue) {
        await storagevalueRepository.save(key, newValue.rawValue);
      } else {
        await storagevalueRepository.save(key, newValue);
      }
      _value = newValue ?? _initValue;
    } catch (error, stackTrace) {
      log.e(error, stackTrace: stackTrace);
      _value = previousValue;
    }
  }

  final T _initValue;
  T get initValue => _initValue;

  _StorageValueBase({required this.key, required T initValue})
      : _value = initValue,
        _initValue = initValue {
    if (initValue is AbstractValue) {
      final rawValue =
          storagevalueRepository.get<dynamic>(key) ?? initValue.rawValue;
      _value = initValue.fromRawValue(rawValue) as T;
    } else {
      _value = storagevalueRepository.get(key) ?? initValue;
    }
  }

  @override
  FutureOr onDispose() {}
}
