import 'package:bookstore_flutter/Components/theme.dart';
import 'package:bookstore_flutter/Sayfalar/best%20seller/bestsellerview.dart';
import 'package:bookstore_flutter/Sayfalar/home/homeview.dart';
import 'package:bookstore_flutter/Sayfalar/login/loginview.dart';
import 'package:bookstore_flutter/Sayfalar/register/register_view.dart';
import 'package:bookstore_flutter/Sayfalar/splash/splashview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          onGenerateRoute: (settings) {
            final token = settings.arguments as String;

            return MaterialPageRoute(
                builder: (context) => LoginView(token: token));
          },
          routes: {
            '/loginRoute': (context) => const LoginView(token: ""),
            '/registerRoute': (context) => const RegisterView(),
            '/homeRoute': (context) => const HomeView(token: ""),
            '/bestsellerRoute': (context) =>
                BestSellerView(contentList: [], title: "", token: ""),
            //  '/bookDetailsRoute': (context) => BookDetailsView(
            //      token: "",
            //    content: null,
            //),
          },
          theme: GTheme().gTheme,
          home: const SplashPage(token: ""),
        );
      },
    );
  }
}
