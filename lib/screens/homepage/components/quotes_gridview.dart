import 'package:quotes_app_2/headers.dart';

Widget quotesGridView() {
  return Expanded(
    flex: 12,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thickness: 5,
        interactive: true,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: allQuotes.length,
          itemBuilder: (context, index) => GestureDetector(
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      allQuotes[index].quote,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("- ${allQuotes[index].author}"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
