import 'package:ai_app/services/openai_services.dart';
import 'package:ai_app/utils/chat_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ChatGptScreen extends StatefulWidget {
  ChatGptScreen({Key? key}) : super(key: key);

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  var showAnswer = false;
  var showLoading = false;
  var showUserContainer = false;
  OpenAi openAi = OpenAi();
  var text = 'Hello';
  ScrollController textFieldController = ScrollController();
  TextEditingController inputController = TextEditingController();
  String? answer;
  List<Map<String, dynamic>> allAnswers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          FaIcon(FontAwesomeIcons.solidMoon, color: Colors.deepPurple, size: 25,),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: allAnswers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return allAnswers[index]['text'] == 'anim'
                          ? LottieBuilder.asset(
                              'assets/animations/loading.json',
                              height: height * 0.1,
                              width: width * 0.1,
                              alignment: Alignment.centerLeft,
                            )
                          : ChatContainer(text: allAnswers[index]['text'], chatNum: allAnswers[index]['type']);
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                allAnswers.clear();
                                setState(() {

                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  minimumSize: Size(75, 35)),
                              child: Row(
                                children: [
                                  Text('Clear '),
                                  Icon(
                                    Icons.delete,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              )),
                          OutlinedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  minimumSize: Size(75, 35)),
                              child: Row(
                                children: [
                                  Text('Voice '),
                                  Icon(
                                    Icons.volume_up,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              )),
                          OutlinedButton(
                              onPressed: () async {
                                showUserContainer = true;
                                allAnswers.insert(0,
                                  {
                                    'text' : inputController.text.toString(),
                                    'type' : 1
                                  }
                                );
                                allAnswers.insert(0, {
                                  'text' : 'anim',
                                  'type' : 0
                                });
                                String question = inputController.text.toString();
                                inputController.clear();
                                setState(() {});
                                answer = await openAi
                                    .gptApi(question);
                                showUserContainer = false;
                                showAnswer = true;
                                if (answer != null) allAnswers.removeAt(0);
                                allAnswers.insert(0, {
                                  'text' : answer,
                                  'type' : 2
                                });
                                answer = null;
                                showLoading = false;
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  minimumSize: Size(75, 35)),
                              child: Row(
                                children: [
                                  Text('Send '),
                                  Icon(
                                    Icons.send_outlined,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Container(
                        width: width,
                        height: 70,
                        child: SingleChildScrollView(
                          child: TextFormField(
                            maxLines: null,
                            controller: inputController,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onChanged: (value) {
                              textFieldController.jumpTo(
                                  textFieldController.position.maxScrollExtent);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
