import 'package:provider/provider.dart';
import 'package:quotes_app_2/Controller/quote_controller.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/screens/homepage/components/category.dart';
import 'package:quotes_app_2/screens/homepage/components/quotes_gridview.dart';
import 'package:quotes_app_2/screens/homepage/components/quotes_listview.dart';
import 'package:quotes_app_2/utils/appdata.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isList = true;
  String? selectedCategory;
  List<Map<String, dynamic>> selectCategory = [];
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    Controller c = Provider.of<Controller>(context);
    void restart() {
      setState(() {});
    }

    return Scaffold(
      appBar: myAppBar(
        isDark: isDark,
        getsetState: () {
          restart();
        },
        context: context,
      ),
      body: Controller.allQuotes.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Column(
                    children: List.generate(
                      5,
                      (index) => const Card(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 127,
                            ),
                          ],
                        ),
                        // child: ,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                // color: Colors.blue,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Category',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _isList = !_isList;
                              setState(() {});
                            },
                            icon: Icon(
                              _isList ? Icons.grid_view_outlined : Icons.list,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // categoryList(
                      //   selectedCategory: '',
                      //   selectCategory: [],
                      //   c: c,
                      // ),
                      // const SizedBox(height: 10),
                      _isList
                          ? quotesListView(
                              selectedCategory: '',
                              selectCategory: [],
                              c: c,
                              getsetState: () {
                                restart();
                              },
                            )
                          : quotesGridView(c: c),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
