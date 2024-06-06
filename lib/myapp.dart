import 'package:quotes_app_2/utils/global.dart';

import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: Globals.isDark ? ThemeMode.dark() : ThemeData.light(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        // scaffoldBackgroundColor:
        //     Globals.isDark ? const Color(0xffE4EfE9) : const Color(0xff93A5CF),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Globals.isDark ? Colors.black : Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: MyRoutes.routes,
    );
  }
}
