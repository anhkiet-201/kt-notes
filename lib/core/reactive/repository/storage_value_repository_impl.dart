import 'package:myapp/core/arch/data/local/local_storage.dart';
import 'package:myapp/core/arch/data/local/local_storage_provider.dart';
import 'package:myapp/core/reactive/repository/storage_value_repository.dart';

/// {@template storage_value_repository_impl}
/// Implementation of [StorageValueRepository] using [LocalStorageProvider].
/// {@endtemplate}
class StorageValueRepositoryImpl extends StorageValueRepository
    with LocalStorageProvider {
  /// {@macro storage_value_repository_impl}
  StorageValueRepositoryImpl();

  /// {@template storage_value_repository_impl.get}
  /// Gets the value associated with the given [key] from local storage.
  /// {@endtemplate}
  @override
  T? get<T>(LocalStorageKey<T> key) => localStorage.get(key);

  /// {@template storage_value_repository_impl.remove}
  /// Removes the value associated with the given [key] from local storage.
  /// {@endtemplate}
  @override
  Future<void> remove<T>(LocalStorageKey<T> key) => localStorage.delete(key);

  /// {@template storage_value_repository_impl.save}
  /// Saves the given [value] associated with the given [key] to local storage.
  /// {@endtemplate}
  @override
  Future<void> save<T>(LocalStorageKey<T> key, T value) =>
      localStorage.put(key, value);
}
