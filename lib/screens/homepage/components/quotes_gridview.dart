import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/utils/global.dart';

Widget quotesGridView({
  required Controller c,
}) {
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
          itemCount: Controller.allQuotes.length,
          itemBuilder: (context, index) => GestureDetector(
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
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Controller.allQuotes[index].text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Globals.isDark
                            ? Colors.black
                            : const Color(0xffE4EfE9),
                      ),
                    ),
                    const SizedBox(height: 47),
                    Text(
                      "- ${Controller.allQuotes[index].author}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Globals.isDark
                            ? Colors.black
                            : const Color(0xffE4EfE9),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Globals.isOn
                          ? const Icon(Icons.favorite)
                          : Icon(
                              Icons.favorite_border,
                              color:
                                  Globals.isDark ? Colors.black : Colors.white,
                            ),
                    ),
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
