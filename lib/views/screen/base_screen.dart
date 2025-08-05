import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/nav/appointment_nav.dart';
import 'package:wellbyn/nav/doctor.dart';
import 'package:wellbyn/nav/home_nav.dart';
import 'package:wellbyn/nav/profile_nav.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import '../../controllers/baseController/base_controller.dart';

import '../base/NavBar/nav_bar.dart';


// STEP 1: Optimized BaseScreen with lazy loading and widget caching
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  // Step 2: Cache static widgets that don't change
  static  Widget _homeScreen = HomeScreen();

  static const Widget _bottomNavBar = BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentIndex = BaseController.to.currentIndex.value;
        // Step 3: Use conditional rendering instead of IndexedStack for better memory
        return _buildCurrentScreen(currentIndex);
      }),
      bottomNavigationBar: _bottomNavBar,
    );
  }

  // Step 4: Build only the current screen to save memory
  Widget _buildCurrentScreen(int index) {
    switch (index) {
      case 0:
        return HomeNav();
      case 1:
        return DoctorNav();
      case 2:
        return  AppointmentNav();
      case 3:
        return const ProfileNav();
      default:
        return _homeScreen;
    }
  }
}

// // ALTERNATIVE: If you need to keep IndexedStack (for state preservation)
// class BaseScreenWithIndexedStack extends StatefulWidget {
//   const BaseScreenWithIndexedStack({super.key});
//
//   @override
//   State<BaseScreenWithIndexedStack> createState() => _BaseScreenWithIndexedStackState();
// }
//
// class _BaseScreenWithIndexedStackState extends State<BaseScreenWithIndexedStack>
//     with AutomaticKeepAliveClientMixin {
//
//   // Step 5: Lazy initialization of screens
//   late final List<Widget> _screens;
//   bool _initialized = false;
//
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeScreens();
//   }
//
//   void _initializeScreens() {
//     if (!_initialized) {
//       _screens = [
//          HomeScreen(),
//         const OptimizedDoctorNav(),
//         const Appointment(),
//         const ProfileNav(),
//       ];
//       _initialized = true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // Required for AutomaticKeepAliveClientMixin
//
//     return Scaffold(
//       body: Obx(() => IndexedStack(
//         index: BaseController.to.currentIndex.value,
//         children: _screens,
//       )),
//       bottomNavigationBar: const BottomNavBar(),
//     );
//   }
// }
//
// // STEP 6: Highly optimized DoctorNav with route caching and lazy loading
// class OptimizedDoctorNav extends StatefulWidget {
//   const OptimizedDoctorNav({super.key});
//
//   @override
//   State<OptimizedDoctorNav> createState() => _OptimizedDoctorNavState();
// }
//
// class _OptimizedDoctorNavState extends State<OptimizedDoctorNav>
//     with AutomaticKeepAliveClientMixin {
//
//   @override
//   bool get wantKeepAlive => true;
//
//   // Step 7: Pre-define route names as constants
//   static const String doctorDetailsRoute = '/doctor_details';
//   static const String bookReportRoute = '/book_report';
//   static const String bookOverviewRoute = '/book_overview';
//   static const String defaultRoute = '/';
//
//
//   // Step 8: Cache navigator key
//   late final GlobalKey<NavigatorState> _navigatorKey;
//
//   @override
//   void initState() {
//     super.initState();
//     _navigatorKey = Get.nestedKey(NavIds.profile)!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // Required for AutomaticKeepAliveClientMixin
//
//     return Navigator(
//       key: _navigatorKey,
//       onGenerateRoute: _generateRoute,
//     );
//   }
//
//   // Step 9: Optimized route generation with switch statement
//   Route<dynamic>? _generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case doctorDetailsRoute:
//         return _buildDoctorDetailsRoute(settings);
//       case bookReportRoute:
//         return _buildBookReportRoute(settings);
//       case bookOverviewRoute:
//         return _buildBookOverviewRoute(settings);
//
//       default:
//         return _buildDefaultRoute(settings);
//     }
//   }
//
//   // Step 10: Separate route builders for better organization and caching
//   MaterialPageRoute _buildDoctorDetailsRoute(RouteSettings settings) {
//     final args = settings.arguments as Map<String, dynamic>?;
//     return MaterialPageRoute(
//       settings: settings,
//       builder: (_) => DoctorDetails(doctorId: args?['doctorId'] ?? ''),
//     );
//   }
//
//   MaterialPageRoute _buildBookReportRoute(RouteSettings settings) {
//     return MaterialPageRoute(
//       settings: settings,
//       builder: (_) =>  BookReport(),
//     );
//   }
//
//   MaterialPageRoute _buildBookOverviewRoute(RouteSettings settings) {
//     return MaterialPageRoute(
//       settings: settings,
//       builder: (_) =>  BookOverview(),
//     );
//   }
//
//   MaterialPageRoute _buildDefaultRoute(RouteSettings settings) {
//     return MaterialPageRoute(
//       settings: settings,
//       builder: (_) =>  Doctor(),
//     );
//   }
// }
//
// // STEP 11: Alternative DoctorNav with route table for even better performance
// // class SuperOptimizedDoctorNav extends StatelessWidget {
// //   const SuperOptimizedDoctorNav({super.key});
// //
// //   // Step 12: Pre-built route table
// //   static final Map<String, WidgetBuilder> _routes = {
// //     '/': (_) =>  Doctor(),
// //     '/doctor_details': (_) =>  DoctorDetails(doctorId: ''), // Will be overridden
// //     '/book_report': (_) =>  BookReport(),
// //     '/book_overview': (_) =>  BookOverview(),
// //   };
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Navigator(
// //       key: Get.nestedKey(NavIds.profile),
// //       initialRoute: '/',
// //       onGenerateRoute: (settings) {
// //         // Step 13: Fast route lookup
// //         final routeName = settings.name ?? '/';
// //
// //         if (routeName == '/doctor_details') {
// //           final args = settings.arguments as Map<String, dynamic>?;
// //           return MaterialPageRoute(
// //             settings: settings,
// //             builder: (_) => DoctorDetails(doctorId: args?['doctorId'] ?? ''),
// //           );
// //         }
// //
// //         final builder = _routes[routeName] ?? _routes['/'];
// //         return MaterialPageRoute(
// //           settings: settings,
// //           builder: builder!,
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // // STEP 14: Route configuration class for better organization
// // class DoctorRoutes {
// //   static const String home = '/';
// //   static const String doctorDetails = '/doctor_details';
// //   static const String bookReport = '/book_report';
// //   static const String bookOverview = '/book_overview';
// //
// //   static final Map<String, Widget Function(BuildContext, RouteSettings)> routes = {
// //     home: (context, settings) =>  Doctor(),
// //     doctorDetails: (context, settings) {
// //       final args = settings.arguments as Map<String, dynamic>?;
// //       return DoctorDetails(doctorId: args?['doctorId'] ?? '');
// //     },
// //     bookReport: (context, settings) =>  BookReport(),
// //     bookOverview: (context, settings) =>  BookOverview(),
// //   };
// // }
// //
// // // STEP 15: Final optimized version using route configuration
// // class FinalOptimizedDoctorNav extends StatelessWidget {
// //   const FinalOptimizedDoctorNav({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Navigator(
// //       key: Get.nestedKey(NavIds.profile),
// //       onGenerateRoute: (settings) {
// //         final routeName = settings.name ?? DoctorRoutes.home;
// //         final routeBuilder = DoctorRoutes.routes[routeName] ??
// //             DoctorRoutes.routes[DoctorRoutes.home];
// //
// //         return MaterialPageRoute(
// //           settings: settings,
// //           builder: (context) => routeBuilder!(context, settings),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // // STEP 16: Enhanced BaseController optimization (add this to your controller)
// // extension BaseControllerOptimization on BaseController {
// //   // Preload screens method
// //   void preloadScreens() {
// //     // This can be called during app initialization
// //   }
// //
// //   // Optimized page change with validation
// //   void changePageOptimized(int index) {
// //     if (index >= 0 && index < 4 && currentIndex.value != index) {
// //       currentIndex.value = index;
// //     }
// //   }
// // }