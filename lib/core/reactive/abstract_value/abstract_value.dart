/// Abstract class for values that can be observed and updated.
///
/// Provides a way to get the raw value and create a new instance from a raw value.
abstract class AbstractValue<T> {
  /// Gets the raw value of the object.
  T get rawValue;

  /// Creates a new instance of the object from a raw value.
  ///
  /// The raw value can be of any type, but it must be convertible to the type of the object.
  AbstractValue<T> fromRawValue(dynamic rawValue);
}
