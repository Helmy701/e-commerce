import 'package:e_commerce/Router/App_Router.dart';
import 'package:e_commerce/layout/Home_Layout.dart';
import 'package:e_commerce/layout/screens/HomeScreen_Screens/Product_Screen/Product_Screen.dart';
import 'package:e_commerce/layout/screens/more/My_Orders.dart';
import 'package:e_commerce/screens/Change_password.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        saveLocale: true,
        useOnlyLangCode: true,
        path: 'assets/translations',
        startLocale: const Locale('ar'),
        child: MyApp(
          appRouter: AppRouter(),
        )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(fontFamily: 'Tajawal'),
          onGenerateRoute: appRouter.generateRoute,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          routes: const {},
          // theme: ThemeData(

          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          home: child,
        );
      },
      child: const HomeLayout(),
    );
  }
}
