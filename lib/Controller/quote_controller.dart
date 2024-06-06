import 'package:flutter/cupertino.dart';
import 'package:quotes_app_2/modals/quotes_modal.dart';
import 'package:quotes_app_2/services/quotes_helper.dart';
import 'package:logger/logger.dart';

class Controller extends ChangeNotifier {
  Logger logger = Logger();
  static List<Quote> allQuotes = [];
  static List<String> allCategories = allQuotes
      .map(
        (e) => e.category,
      )
      .toSet()
      .toList();

  Controller() {
    getQuotes();
  }

  Future<void> getQuotes() async {
    allQuotes = await DbHelper.instance.getQuotes();
    logger.i("Quotes: $allQuotes");
    notifyListeners();
  }
}
