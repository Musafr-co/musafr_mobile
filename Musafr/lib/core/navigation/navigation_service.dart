abstract class NavigationService {
  void navigateTo(String routeName, {Object? extra});
  void goBack();
  // Add other navigation methods as needed, e.g.:
  // void navigateToAndRemoveUntil(String routeName, String untilRouteName, {Object? extra});
  // void replaceWith(String routeName, {Object? extra});
}
