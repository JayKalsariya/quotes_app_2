import 'package:flutter/cupertino.dart';
import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/utils/global.dart';

AppBar myAppBar({
  required isDark,
  required Function() getsetState,
  required BuildContext context,
}) {
  return AppBar(
    title: Text(
      'Quotes App',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Globals.isDark ? Colors.black : Colors.white,
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: (Globals.isDark == true)
            ? const LinearGradient(
                colors: [
                  Color(0xff93A5CF),
                  Color(0xffE4EfE9),
                ],
              )
            : const LinearGradient(
                colors: [
                  Color(0xff070F2B),
                  Color(0xff535C91),
                ],
              ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Globals.isDark = !Globals.isDark;
          getsetState();
        },
        icon: Globals.isDark
            ? const Icon(Icons.nightlight)
            : const Icon(Icons.light_mode, color: Colors.white),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.favPage);
          getsetState();
        },
        icon: Icon(
          Icons.favorite,
          color: Globals.isDark ? Colors.black : Colors.white,
        ),
      ),
    ],
  );
}
