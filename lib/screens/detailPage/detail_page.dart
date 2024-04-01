import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:quotes_app_2/screens/detailPage/components/appbar2.dart';
import 'package:quotes_app_2/utils/fonts_enum.dart';
import 'package:quotes_app_2/utils/global.dart';
import 'dart:ui' as ui;

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  GlobalKey widgetKey = GlobalKey();

  Future<File> getFileFromWidget() async {
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
      pixelRatio: 15,
    );
    ByteData? data = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List list = data!.buffer.asUint8List();

    Directory directory = await getTemporaryDirectory();
    File file = await File(
            "${directory.path}/QA${DateTime.now().millisecondsSinceEpoch}.png")
        .create();
    file.writeAsBytesSync(list);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    Quote quote = ModalRoute.of(context)!.settings.arguments as Quote;

    return Scaffold(
      appBar: myAppBar2(
        quote: quote,
        onReset: () {
          Globals.reset();
          setState(() {});
        },
        context: context,
        getFileFromWidget: () {
          return getFileFromWidget();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RepaintBoundary(
                key: widgetKey,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(Globals.radius),
                    color: Globals.color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Quote
                      Text(
                        quote.quote,
                        style: TextStyle(
                          color: Globals.fcolor,
                          fontSize: 20,
                          fontFamily: Globals.font,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Author
                      Text(
                        "📝 ${quote.author}",
                        style: TextStyle(
                          color: Globals.fcolor,
                          fontSize: 16,
                          fontFamily: Globals.font,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Card',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Globals.on = !Globals.on;
                      setState(() {});
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(height: 10),
//Editing Tools
              Visibility(
                visible: Globals.on,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
//BG Color Title
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Background Color',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
//Color Picker
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Color Picker"),
                                        content: SingleChildScrollView(
                                          child: ColorPicker(
                                            pickerColor: Globals.color,
                                            onColorChanged: (value) {
                                              Globals.color = value;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.colorize),
                              ),
                            ),
                            SizedBox(width: 4),
//List of Colors
                            ...List.generate(
                              18,
                              (index) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Globals.color = Colors.primaries[index];
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.primaries[index],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Globals.color = Colors.white;
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Globals.color = Colors.black;
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
//Font Color Title
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Font Color',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
//Color Picker
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Color Picker"),
                                        content: SingleChildScrollView(
                                          child: ColorPicker(
                                            pickerColor: Globals.fcolor,
                                            onColorChanged: (value) {
                                              Globals.fcolor = value;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.colorize),
                              ),
                            ),
                            SizedBox(width: 4),
//List of Colors
                            ...List.generate(
                              18,
                              (index) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Globals.fcolor = Colors.primaries[index];
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.primaries[index],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Globals.color = Colors.white;
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Globals.color = Colors.black;
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
//Radius Title
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Card Radius',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
//Card Radius Slider
                      Slider(
                        value: Globals.radius,
                        onChanged: (value) {
                          Globals.radius = value;
                          setState(() {});
                        },
                        min: 0,
                        max: 30,
                      ),
                      const SizedBox(height: 10),
//Font Style
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Font Style',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: CardFont.values
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Globals.font = e.name;
                                      setState(() {});
                                    },
                                    child: Text(
                                      'Abc',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: e.name,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Globals.color = Colors.white;
          Globals.font = CardFont.roboto.name;
          Globals.radius = 0;
          Globals.fcolor = Colors.black;
          setState(() {});
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Color(0xda93a5cf),
      ),
    );
  }
}
