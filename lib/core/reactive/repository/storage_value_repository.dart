import 'package:myapp/core/arch/data/local/local_storage.dart';
import 'package:myapp/core/base/base_repository.dart';

/// A type-safe, key-value storage repository for persistent local data storage.
///
/// The [StorageValueRepository] provides an abstraction layer over the underlying
/// storage mechanism, allowing for the storage and retrieval of strongly-typed values
/// using [LocalStorageKey]s. This design ensures type safety and helps prevent errors
/// related to type mismatches.
///
/// By extending [BaseRepository], it integrates into the application's broader
/// repository architecture, potentially inheriting common functionality or adhering
/// to established patterns.
///
/// Implementations of this abstract class can utilize various storage backends such as:
/// - Shared Preferences
/// - SQLite databases
/// - In-memory caches
/// - File system storage
///
/// Key features:
/// - Type-safe storage and retrieval using generics.
/// - Asynchronous write operations (`save` and `remove`).
/// - Synchronous read operation (`get`) for fast access.
///
/// Usage considerations:
/// - Ensure that concrete implementations handle errors gracefully, such as storage
///   failures or type mismatches.
/// - The synchronous nature of the `get` method implies that implementations should
///   provide fast, preferably in-memory, access to the stored data.
/// - Thread-safety should be considered in the implementation, especially if the
///   repository will be accessed from multiple isolates or threads.
/// - While not explicitly part of this interface, implementations may need to handle
///   initialization (e.g., opening database connections) and cleanup (e.g., releasing resources).
///   These concerns might be addressed in the [BaseRepository] or in the concrete class.
///
/// Example:
/// ```dart
/// final repo = MyStorageValueRepository();  // Concrete implementation
/// final userNameKey = LocalStorageKey<String>('user_name');
///
/// // Storing a value
/// await repo.save(userNameKey, 'Alice');
///
/// // Retrieving a value
/// final userName = repo.get(userNameKey);  // Returns 'Alice'
///
/// // Removing a value
/// await repo.remove(userNameKey);
/// ```
///
/// Note: This repository is designed for local storage. For remote or distributed
/// storage systems, consider adapting the interface to handle network latency and errors,
/// which might involve making all operations asynchronous.
abstract class StorageValueRepository extends BaseRepository {
  /// Persists a value in the storage.
  ///
  /// Saves the provided [value] of type [T] using the specified [key]. This operation
  /// is asynchronous and returns a [Future] that completes when the value has been
  /// successfully saved or throws an exception if the save operation fails.
  ///
  /// - [T] is the type of the value being saved.
  /// - [key] is the [LocalStorageKey] associated with the value, ensuring type safety.
  /// - [value] is the data to be stored.
  ///
  /// Implementations should handle potential storage errors (e.g., out of space)
  /// and may choose to overwrite any existing value associated with the same key.
  Future<void> save<T>(LocalStorageKey<T> key, T value);

  /// Deletes a value from the storage.
  ///
  /// Removes the value associated with the given [key] from the storage. This operation
  /// is asynchronous and returns a [Future] that completes when the value has been
  /// successfully removed or if no value was associated with the key.
  ///
  /// - [T] is the type of the value to be removed.
  /// - [key] is the [LocalStorageKey] identifying the value to remove.
  ///
  /// If no value is associated with the key, implementations typically complete
  /// the future successfully without taking any action.
  Future<void> remove<T>(LocalStorageKey<T> key);
  
  /// Retrieves a value from the storage.
  ///
  /// Fetches the value associated with the provided [key] from the storage. This is a
  /// synchronous operation, designed for fast retrieval.
  ///
  /// - [T] is the expected type of the value to be retrieved.
  /// - [key] is the [LocalStorageKey] identifying the value.
  ///
  /// Returns the value of type [T] if found, or `null` if no value is associated
  /// with the key or if the associated value cannot be cast to type [T].
  ///
  /// Implementation notes:
  /// - This method must be non-blocking and return quickly. Consider using caching
  ///   or in-memory storage to achieve this.
  /// - Error handling for type mismatches should be implemented. It's recommended
  ///   to return `null` if the stored value is not of type [T], rather than throwing
  ///   an exception, to maintain the method's non-throwing nature.
  /// - Logging type mismatch incidents can help with debugging without disrupting
  ///   the application's flow.
  T? get<T>(LocalStorageKey<T> key);
}