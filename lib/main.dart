import 'package:provider/provider.dart';
import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/services/quotes_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'headers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.getStringList("quote") ?? [];

  DbHelper.instance.initDb();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: const MyApp(),
    ),
  );
}
