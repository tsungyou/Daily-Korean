import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // Global keys to reference specific widgets
  final searchButtonKey = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;
  
  @override
  void initState() {
    super.initState();
    // Create the tutorial after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _createTutorial();
      _showTutorial();
    });
  }

  void _createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.black87,
      onFinish: () {
      },
      onSkip: () {
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    
    targets.add(
      TargetFocus(
        identify: "search_button",
        keyTarget: searchButtonKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Click this to search for your desired grammar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    
    return targets;
  }

  void _showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial Example'),
      ),
      body: Center(
        child: ElevatedButton(
          key: searchButtonKey, // Attach the global key to the target widget
          onPressed: () {
            // Your search functionality
          },
          child: const Text('Search Grammar'),
        ),
      ),
    );
  }
}