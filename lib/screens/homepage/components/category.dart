import 'dart:developer';

import 'package:quotes_app_2/headers.dart';

Widget categoryList({
  required String selectedCategory,
  required List<String> selectCategory,
}) {
  return StatefulBuilder(builder: (context, setState) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          allCategories.length,
          (index) => GestureDetector(
            onTap: () {
              selectedCategory = allCategories[index];

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
                color: allCategories[index] == selectedCategory
                    ? const Color(0xff93A5CF)
                    : const Color(0xffE4EfE9),
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(allCategories[index].toString().replaceFirst(
                  allCategories[index][0],
                  allCategories[index][0].toUpperCase())),
            ),
          ),
        ),
      ),
    );
  });
}
