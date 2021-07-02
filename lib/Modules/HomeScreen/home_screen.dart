import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/ApiModule/api_router.dart';
import 'package:rest_api/Model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restful Api Demo'),
        ),
        body: _buildBody(context));
  }

  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = ApiRouter(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final ResponseData posts = snapshot.data ?? ResponseData();
          return _buildListView(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  Widget _buildListView(BuildContext context, ResponseData posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(
              Icons.account_box,
              color: Colors.green,
              size: 50,
            ),
            title: Text(
              posts.data?[index]['name'],
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(posts.data?[index]['email']),
          ),
        );
      },
      itemCount: posts.data?.length,
    );
  }
}
