import 'package:ai_app/ui/chat_gpt_screen.dart';
import 'package:ai_app/utils/pallets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('AI', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                width: 150, height: 150,
                decoration: BoxDecoration(
                  color: Pallete.firstSuggestionBoxColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://www.pngitem.com/pimgs/m/65-658307_female-virtual-assistant-icon-hd-png-download.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Container(
                height: height * 0.12, width: width,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 25),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(15))
                ),
                child: Text('Welcome, what task\n can I do for you ?', style: TextStyle(fontSize: 18, color: Pallete.mainFontColor, fontFamily: 'Cera Pro', fontWeight: FontWeight.bold,height: 1.3)),
              ),
              InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ChatGptScreen(),)),
                child: Container(
                  width: width, height: height * 0.13,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Pallete.firstSuggestionBoxColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ChatGPT', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                      Text('A smarter way to stay organized and informed with Chat GPT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ),
              Container(
                width: width, height: height * 0.13,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Pallete.firstSuggestionBoxColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dall-E', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                    Text('Create any image with your personal assistant powered by Dall-E AI', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Container(
                width: width, height: height * 0.13,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Pallete.firstSuggestionBoxColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Smart Voice Assistant', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                    Text('Use both features with a voice assistant', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
 */