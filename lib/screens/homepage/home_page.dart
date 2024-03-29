import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/screens/homepage/components/category.dart';
import 'package:quotes_app_2/screens/homepage/components/quotes_gridview.dart';
import 'package:quotes_app_2/screens/homepage/components/quotes_listview.dart';
import 'package:quotes_app_2/utils/appdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isList = true;
  String? selectedCategory;
  List<Map<String, dynamic>> selectCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,
          // color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
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
                categoryList(
                  selectedCategory: '',
                  selectCategory: [],
                  // setState: setState(() {}),
                ),
                const SizedBox(height: 10),
                _isList ? quotesListView() : quotesGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
