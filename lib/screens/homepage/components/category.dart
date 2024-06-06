import 'dart:developer';

import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/headers.dart';

Widget categoryList({
  required String selectedCategory,
  required List<String> selectCategory,
  required Controller c,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            Controller.allCategories.length,
            (index) => GestureDetector(
              onTap: () {
                selectedCategory = Controller.allCategories[index];

                // allQuotes
                //     .map((e) => e.category == selectedCategory
                //         ? e
                //         : null)
                //     .toList();
                // selectCategory = allCategories
                //     .where((element) => element == selectedCategory)
                //     .toList();
                log('selectCategory: $selectedCategory');
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Controller.allCategories[index] == selectedCategory
                      ? const Color(0xff93A5CF)
                      : const Color(0xffE4EfE9),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(Controller.allCategories[index]
                    .toString()
                    .replaceFirst(Controller.allCategories[index][0],
                        Controller.allCategories[index][0].toUpperCase())),
              ),
            ),
          ),
        ),
      );
    },
  );
}
