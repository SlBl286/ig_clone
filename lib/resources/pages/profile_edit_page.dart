import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/profile_edit_controller.dart';

class ProfileEditPage extends NyStatefulWidget {
  static const route = 'profile_edit_page';
  final ProfileEditController controller = ProfileEditController();
  
  ProfileEditPage({Key? key}) : super(key: key);
  
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends NyState<ProfileEditPage> {

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
        child: Container()
      ),
    );
  }
}
