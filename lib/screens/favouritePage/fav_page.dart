import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    Controller c = Provider.of<Controller>(context);
    late SharedPreferences pref;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Globals.isDark ? Colors.black : Colors.white,
          ),
        ),
        title: Text(
          'Favorite Quotes',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Expanded(
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
              itemCount: Globals.fav.length,
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
        ),
      ),
    );
  }
}
