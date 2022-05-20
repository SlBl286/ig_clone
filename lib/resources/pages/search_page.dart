import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/search_controller.dart';

class SearchPage extends NyStatefulWidget {
  static const String route = "/search";
  final SearchController controller = SearchController();
  
  SearchPage({Key? key}) : super(key: key);
  
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends NyState<SearchPage> {

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
        child: Container(  child: Text('search'),)
      ),
    );
  }
}
