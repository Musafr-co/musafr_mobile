import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/sign_in_phone_number_view.dart';
import 'app_routes.dart';

// ShellRoute for persistent UI elements like BottomNavigationBar can be added here if needed in the future.

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorKey =
// GlobalKey<NavigatorState>(debugLabel: 'shell'); // Uncomment if using ShellRoute

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.signInPhoneNumber, // Set your initial route
    debugLogDiagnostics: true, // Enable for development, disable for production
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.signInPhoneNumber,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPhoneNumberView(); // Your initial screen
        },
        // routes: <RouteBase>[ // Example of nested routes
        //   GoRoute(
        //     path: 'details', // e.g., /signInPhoneNumber/details
        //     builder: (BuildContext context, GoRouterState state) {
        //       return const DetailsScreen(); // Replace with your details screen
        //     },
        //   ),
        // ],
      ),
      // Add other top-level routes here:
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const HomeScreen(); // Replace with your home screen
      //   },
      // ),
      // Example of a route with a parameter:
      // GoRoute(
      //   path: AppRoutes.userDetails, // e.g., '/user/:userId'
      //   builder: (BuildContext context, GoRouterState state) {
      //     final userId = state.pathParameters['userId'];
      //     if (userId == null) {
      //       // Handle error or redirect, perhaps to a 404 page
      //       return const Text("Error: User ID missing");
      //     }
      //     return UserDetailsScreen(userId: userId); // Replace with your user details screen
      //   },
      // ),
    ],
    // errorBuilder: (context, state) => ErrorScreen(error: state.error), // Optional: Custom error screen
    // redirect: (BuildContext context, GoRouterState state) { // Optional: Global redirection logic
    //   // e.g., redirect to login if user is not authenticated
    //   // final bool loggedIn = ... ; // check your auth status
    //   // final bool loggingIn = state.matchedLocation == AppRoutes.login;
    //   // if (!loggedIn && !loggingIn) return AppRoutes.login;
    //   // if (loggedIn && loggingIn) return AppRoutes.home;
    //   return null; // No redirection
    // },
  );
}

// TODO:
// 1. Create the actual screen widgets (e.g., HomeScreen, DetailsScreen, UserDetailsScreen, ErrorScreen)
//    if they don't exist.
// 2. Define the corresponding route paths in app_routes.dart.
// 3. Implement the NavigationServiceImpl using GoRouter.
// 4. Set up dependency injection for NavigationService.
// 5. Update your MaterialApp to use .router constructor with AppRouter.router.
