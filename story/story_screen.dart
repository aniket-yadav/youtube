import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryScreen extends StatelessWidget {
  final StoryController controller;
  final List<StoryItem> storyItems;
  const StoryScreen({
    super.key,
    required this.controller,
    required this.storyItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        controller: controller, // pass controller here too

        onStoryShow: (s) {
          print(s);
          //  this get called on every story screen
        },
        onComplete: () {
          print("complete");
          Navigator.pop(context);
          //  on completing all slide i am closing this screen 
          //  in case of where we have more than 1 user we would move to next user's data
        },
        onVerticalSwipeComplete: (direction) {
          //  like whatsapp and intagram you can close stgory by upward swipe
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
        storyItems: storyItems, // this is our story item list
      ),
    );
  }
}
//  that's all you need to show this story/status
