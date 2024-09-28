import 'package:go_router/go_router.dart';
import 'package:slidee_app/config/routes/routes.dart';
import 'package:slidee_app/features/auth/create_new_profile/presentation/pages/create_new_profile.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/pages/login_screen.dart';
import 'package:slidee_app/features/auth/register_screen/presentation/pages/register_screen.dart';
import 'package:slidee_app/features/onboarding_screen/presentation/pages/onboarding_screen.dart';

import '../../features/mainlayout_screen/main_screen/presentation/pages/main_lay_out_screen.dart';
import '../../features/splash_screen/presentation/pages/splash_screen.dart';


final getRouter = GoRouter(
  initialLocation: Routes.splashRoute,
  routes: [
    GoRoute(
      path: Routes.splashRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.loginRoute,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: Routes.registerRoute,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: Routes.mainLayoutRoute,
      builder: (context, state) => const MainLayoutScreen(),
    ),
    GoRoute(
      path: Routes.mainLayoutRoute,
      builder: (context, state) => const MainLayoutScreen(),
    ),
    GoRoute(
      path: Routes.createNewProfile,
      builder: (context, state) => CreateNewProfile(),
    ),
  ],
);