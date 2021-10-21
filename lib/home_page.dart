import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain storyBrain = StoryBrain();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 0),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // choice 1
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        storyBrain.getChoice1(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                  // choice 2
                  flex: 1,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          storyBrain.getChoice2(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width * 0.85,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
