import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marshather_app/di/di.dart';
import 'package:marshather_app/presentation/screens/screens.dart';
import 'package:marshather_app/utils/router.dart';
import 'package:marshather_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Palette.backgroundColor,
  ));
  runApp(MaterialApp(theme: myTheme, home: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoute.setStream(context);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        AppRoute.setStream(context);

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<HomeDayHoursCubit>(),
            ),
            BlocProvider(
              create: (_) => sl<SearchGeocodingLocationsCubit>(),
            ),
          ],
          child: MaterialApp.router(
            title: Constants.appName,
            theme: myTheme,
            /*localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,*/
            routerDelegate: AppRoute.router.routerDelegate,
            routeInformationParser: AppRoute.router.routeInformationParser,
            routeInformationProvider: AppRoute.router.routeInformationProvider,
            builder: (context, child) {
              return child!;
            },
          ),
        );
      },
    );
  }
}
