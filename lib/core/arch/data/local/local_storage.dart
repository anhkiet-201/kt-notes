/// An interface for local storage.
abstract class LocalStorage {
  /// The default box name.
  static const String defaultBox = 'default';

  /// The settings box name.
  static const String settingsBox = 'settings';

  /// The secure box name.
  static const String secureBox = 'secure';

  /// The token box name.
  static const String tokenBox = 'token';

  /// Gets the current version of the local storage.
  int get version;

  /// Migrates the local storage to the latest version.
  Future migrate();

  /// Gets the value associated with the given key.
  ///
  /// Returns `null` if the key is not found.
  T? get<T>(LocalStorageKey<T> key);

  /// Gets the list of values associated with the given key.
  ///
  /// Returns `null` if the key is not found.
  List<T>? getList<T>(LocalStorageKey<List<T>> key);

  /// Puts the given value into the local storage.
  Future<void> put<T>(LocalStorageKey<T> key, T value);

  /// Deletes the value associated with the given key.
  Future<void> delete<T>(LocalStorageKey<T> key);
}

/// A key for local storage.
class LocalStorageKey<T> {
  /// The key.
  final String key;

  /// The box name.
  final String boxName;

  /// Creates a new [LocalStorageKey] with the given [key] and [boxName] flag.
  const LocalStorageKey(this.key, {this.boxName = LocalStorage.defaultBox});

  /// Creates a new [LocalStorageKey] for a setting with the given [key].
  const LocalStorageKey.setting(this.key) : boxName = LocalStorage.settingsBox;

  /// Creates a new [LocalStorageKey] for a secure value with the given [key].
  const LocalStorageKey.secure(this.key) : boxName = LocalStorage.secureBox;
}
