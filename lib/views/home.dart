import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app_hive/boxes/boxes.dart';
import 'package:notes_app_hive/models/notes_model.dart';
import 'package:notes_app_hive/resources/constants.dart';
import 'package:notes_app_hive/widgets/button_widgets.dart';
import 'package:notes_app_hive/widgets/date_time.dart';
import 'package:notes_app_hive/widgets/text-widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Notes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: MyColors.darkGreen,
        foregroundColor: MyColors.white,
      ),
      backgroundColor: MyColors.darkGreen,
      body: ValueListenableBuilder(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList();
          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                color: MyColors.lightGreen,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(
                                  text: data[index].title.toString(),
                                  textColor: MyColors.darkGreen,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                DescriptionText(
                                  text: data[index].description.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  titleController.text = data[index].title;
                                  contentController.text =
                                      data[index].description;
                                  Get.defaultDialog(
                                      contentPadding: EdgeInsets.all(12),
                                      title: "Edit Notes",
                                      backgroundColor: MyColors.lightGreen,
                                      titleStyle:
                                          TextStyle(color: MyColors.darkGreen),
                                      titlePadding: EdgeInsets.only(top: 28),
                                      content: Column(
                                        children: [
                                          TextField(
                                            controller: titleController,
                                            decoration: InputDecoration(
                                                label: Text("Title")),
                                          ),
                                          TextField(
                                            controller: contentController,
                                            decoration: InputDecoration(
                                                label: Text("Description")),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          GreenButton(
                                              text: "Edit Notes",
                                              onTap: () {
                                                data[index].title =
                                                    titleController.text;

                                                data[index].description =
                                                    contentController.text;
                                                data[index].save();

                                                Get.back();
                                                titleController.clear();
                                                contentController.clear();
                                              }),
                                        ],
                                      ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  delete(data[index]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DateandTime.showDate(data[index].dateTime),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: DateandTime.showTime(data[index].dateTime),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.orange,
        foregroundColor: Colors.white,
        onPressed: () {
          titleController.clear();
          contentController.clear();
          Get.defaultDialog(
            backgroundColor: MyColors.lightGreen,
            titlePadding: EdgeInsets.only(top: 18),
            contentPadding: EdgeInsets.all(16),
            title: "New Notes",
            titleStyle: TextStyle(color: MyColors.darkGreen),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(label: Text("Title")),
                  ),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(label: Text("Description")),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  OrangeButton(
                    text: "Add Note",
                    onTap: () {
                      DateTime time = DateTime.now();

                      final data = NotesModel(
                        title: titleController.text,
                        description: contentController.text,
                        dateTime: time,
                      );
                      var box = Boxes.getData();
                      box.add(data);
                      data.save();
                      Get.back();
                      titleController.clear();
                      contentController.clear();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }

  delete(NotesModel notesModel) {
    notesModel.delete();
  }
}
