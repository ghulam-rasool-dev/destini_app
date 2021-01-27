import 'package:destini_app/storyBrain.dart';
import 'package:flutter/material.dart';
StoryBrain brain = StoryBrain();
void main() => runApp(destiniApp());

class destiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    brain.getStory(),textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,

                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Visibility(
                    visible: brain.buttonShouldBeVisible(),
                    child: FlatButton(
                      color: Colors.red,
                      child: Text(brain.getChoice1()),
                      onPressed: () {
                        setState(() {
                          brain.nextStory(1);
                        });
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Visibility(
                    visible: brain.buttonShouldBeVisible(),
                    child: FlatButton(
                      color: Colors.red,
                      child: Text(brain.getChoice2()),
                      onPressed: () {
                        setState(() {
                          brain.nextStory(2);
                        });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
