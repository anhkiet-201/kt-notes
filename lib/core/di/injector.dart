part of 'inject_import.dart';

/// The global instance of the `_Injector` class for dependency management.
/// This is used throughout the application to access registered services.
final injector = _Injector();

/// A class responsible for setting up and managing dependency injection
/// using the GetIt package.
/// 
/// This class initializes the GetIt instance, registers services and 
/// provides a method to retrieve these services.
class _Injector {
  /// The GetIt instance used for managing dependencies.
  /// GetIt is a simple service locator for Dart and Flutter projects.
  final _getIt = GetIt.instance;

  /// Initializes the injector by resetting the GetIt instance
  /// and registering the required services.
  /// 
  /// This method is asynchronous because resetting and registering services
  /// might involve asynchronous operations in a real-world scenario.
  Future<void> initialize() async {
    // Reset the GetIt instance to ensure a clean state
    _getIt.reset();
  }

  /// Retrieves a registered service or dependency.
  /// 
  /// The type [T] must be a registered type with GetIt.
  /// 
  /// Returns the instance of the requested type [T].
  /// 
  /// Example usage:
  /// ```dart
  /// var someService = injector.get<SomeService>();
  /// someService.doSomething();
  /// ```
  T get<T extends Object>() {
    return _getIt<T>();
  }
}