import 'dart:developer';

import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/utils/global.dart';

Widget quotesListView({
  required String selectedCategory,
  required List<String> selectCategory,
  required Controller c,
  required Function() getsetState,
}) {
  return Expanded(
    flex: 12,
    // child: ListView.separated(
    //   itemCount: allQuotes.length,
    //   itemBuilder: (context, index) => ExpansionTile(
    //     title: Text(
    //       allQuotes[index].quote,
    //     ),
    //     children: [
    //       Text("Author: ${allQuotes[index].author}"),
    //       Text("Category: ${allQuotes[index].category}"),
    //     ],
    //   ),
    //   separatorBuilder: (context, index) => const Divider(
    //     indent: 16,
    //     endIndent: 16,
    //   ),
    // ),
    child: Scrollbar(
      thickness: 5,
      interactive: true,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Controller.allQuotes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRoutes.detailPage,
                arguments: Controller.allQuotes[index],
              );
            },
            child: Card(
              color: Globals.isDark
                  ? const Color(0xffc1c8da)
                  : const Color(0xff070F2B),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: IconButton(
                    //     onPressed: () {
                    //       Globals.isOn = !Globals.isOn;
                    //       Globals.fav.add(Controller.allQuotes[index]);
                    //       log("=======================");
                    //       getsetState();
                    //     },
                    //     icon: Globals.isOn
                    //         ? const Icon(Icons.favorite, color: Colors.red)
                    //         : Icon(Icons.favorite_border,
                    //             color: Globals.isDark
                    //                 ? Colors.black
                    //                 : Colors.white),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Globals.isOn = !Globals.isOn;
                          Globals.fav.add(Controller.allQuotes[index]);
                          log("=======================");
                        },
                        child: const Text(
                          'Favorite',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      Controller.allQuotes[index].text,
                      style: TextStyle(
                        color: Globals.isDark
                            ? Colors.black
                            : const Color(0xffE4EfE9),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        Controller.allQuotes[index].category,
                        style: TextStyle(
                          color: Globals.isDark
                              ? Colors.black
                              : const Color(0xffE4EfE9),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "~ ${Controller.allQuotes[index].author}",
                        style: TextStyle(
                          color: Globals.isDark
                              ? Colors.black
                              : const Color(0xffE4EfE9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
