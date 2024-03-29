import 'package:quotes_app_2/headers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void nextScreen(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, MyRoutes.homePage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    nextScreen(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
