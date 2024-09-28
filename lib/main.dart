import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slidee_app/config/di/di.dart';
import 'package:slidee_app/features/auth/create_new_profile/presentation/manager/create_new_profile_cubit.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/manager/login_cubit.dart';
import 'package:slidee_app/features/mainlayout_screen/profile_screen/presentation/manager/fetchprofile_cubit.dart';

import 'bloc_observer.dart';
import 'config/routes/route_manger.dart';
import 'features/auth/register_screen/presentation/manager/register_cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
            create: (context) => getIt<RegisterCubit>(),
        ),
        BlocProvider<CreateNewProfileCubit>(
          create: (context) => getIt<CreateNewProfileCubit>(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider<FetchProfileCubit>(
          create: (context) => getIt<FetchProfileCubit>(),
        ),
      ],
      child: SlideeApp()));
}

class SlideeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getRouter,
      ),
    );
  }
}
