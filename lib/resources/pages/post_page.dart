import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/post_controller.dart';

class PostPage extends NyStatefulWidget {
  final PostController controller = PostController();
  
  PostPage({Key? key}) : super(key: key);
  
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends NyState<PostPage> {

  @override
  init() async {
  
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
        child: Container(  child: Text('post'),)
      ),
    );
  }
}
