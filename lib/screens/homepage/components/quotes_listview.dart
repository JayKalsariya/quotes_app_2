import 'package:quotes_app_2/headers.dart';

Widget quotesListView({
  required String selectedCategory,
  required List<String> selectCategory,
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
        itemCount: allQuotes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRoutes.detailPage,
                arguments: allQuotes[index],
              );
            },
            child: Card(
              color: const Color(0xffc1c8da),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allQuotes[index].quote,
                      // style: TextStyle(color: Color(0xffE4EfE9)),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        allQuotes[index].category,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "~ ${allQuotes[index].author}",
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
