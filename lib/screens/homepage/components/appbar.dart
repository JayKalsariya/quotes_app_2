import 'package:quotes_app_2/headers.dart';

AppBar myAppBar() {
  return AppBar(
    title: const Text(
      'Quotes App',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff93A5CF),
            Color(0xffE4EfE9),
          ],
        ),
      ),
    ),
  );
}
