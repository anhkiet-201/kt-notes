import 'package:flutter/material.dart';
/// The types of navigation transitions.
enum PushType {
  /// Pushes a new route onto the navigator stack.
  /// 
  /// This is the standard navigation where the new screen is added on top of the current screen,
  /// and the current screen is kept in the stack. The user can go back to the previous screen.
  normal,

  /// Replaces the current route of the navigator with a new one.
  /// 
  /// This removes the current route from the stack and pushes the new one in its place.
  /// The user cannot go back to the replaced screen.
  replace,

  /// Removes all existing routes from the navigator and then pushes the new route.
  /// 
  /// This clears the entire navigation stack and starts fresh with the new route.
  /// The user cannot go back to any of the previous screens.
  replaceAll;
}

/// The types of animations available for navigation transitions.
enum NavigatorAnimationType {
  /// Fades the new screen in.
  fade,

  /// Slides the new screen in from the right.
  slide,

  /// Scales the new screen up from a smaller size.
  scale,

  /// Combines scaling and fading for the new screen.
  normal,

  /// Rotates the new screen in.
  rotate;

  /// Builds the appropriate transition based on the animation type.
  ///
  /// [context] is the build context.
  /// [animation] is the primary animation driving the transition.
  /// [secondaryAnimation] is the secondary animation (unused in this implementation).
  /// [child] is the widget to be animated, typically the new screen.
  ///
  /// Returns an animated widget wrapping the [child].
  Widget builder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (this) {
      case fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      case slide:
        return SlideTransition(
          position: animation.drive(Tween<Offset>(
              begin: const Offset(1, 0), end: const Offset(0, 0))),
          child: child,
        );
      case scale:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case normal:
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      case rotate:
        return RotationTransition(
          turns: animation.drive(Tween<double>(begin: 0, end: 90)),
          child: child,
        );
    }
  }
}

/// An abstract interface for navigation and UI interaction in a Flutter application.
/// This class provides a centralized way to manage navigation, display dialogs,
/// bottom sheets, and snackbars.
abstract interface class KTNavigator {
  /// A global key for accessing the navigator state throughout the app.
  static final navigationKey = GlobalKey<NavigatorState>();

  /// Provides access to the current build context.
  ///
  /// Returns null if there is no current build context.
  static BuildContext? get globalContext => navigationKey.currentContext;

  /// Navigates to a new page.
  ///
  /// [page] is the widget to be pushed onto the navigation stack.
  /// [type] determines how the page should be pushed (e.g., material or cupertino style).
  /// [animationType] specifies the type of animation to use for the transition.
  /// [duration] sets the duration of the transition animation.
  /// [routeName] is an optional name for the route, useful for deep linking.
  ///
  /// Returns a [Future] that completes with a result when the pushed route is popped off the navigator.
  Future<T?>? push<T>(
    Widget page, {
    PushType type,
    NavigatorAnimationType animationType,
    Duration? duration,
    String? routeName,
  });

  /// Closes the current page and returns to the previous one.
  ///
  /// [result] is an optional value to pass back to the previous page.
  void pop({Object? result});

  /// Displays a snackbar with a message or error.
  ///
  /// [message] is the text to display in the snackbar.
  /// [error] is any error object that should be displayed or logged.
  void showSnackBar({String? message, dynamic error});

  /// Shows a bottom sheet with the given content.
  ///
  /// [page] is the widget to display in the bottom sheet.
  /// [maxChildSize] is the maximum height of the bottom sheet as a fraction of the screen height.
  /// [showDragHandle] determines whether to show a drag handle at the top of the sheet.
  /// [backgroundColor] sets the background color of the sheet.
  /// [initialChildSize] is the initial height of the bottom sheet as a fraction of the screen height.
  /// [snap] enables/disables snapping to [snapSizes].
  /// [title] is an optional title for the bottom sheet.
  /// [snapSizes] is a list of sizes (as fractions of screen height) that the bottom sheet can snap to.
  ///
  /// Returns a [Future] that completes with a result when the bottom sheet is closed.
  Future<T?>? showBottomSheet<T>(
    Widget page, {
    double maxChildSize,
    bool showDragHandle,
    Color? backgroundColor,
    double initialChildSize,
    bool snap,
    String? title,
    List<double>? snapSizes,
  });

  /// Displays a confirmation bottom sheet.
  ///
  /// [page] is the widget to show in the confirmation sheet.
  ///
  /// Returns a [Future] that completes with the result of the confirmation.
  Future<T?>? showConfirmSheet<T>(
    Widget page,
  );

  /// Shows a custom dialog with the provided content.
  ///
  /// [content] is the widget to display in the dialog.
  ///
  /// Returns a [Future] that completes with a result when the dialog is dismissed.
  Future<T?>? showCustomDialog<T>({
    required Widget content,
  });
}
