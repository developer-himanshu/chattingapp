// ignore_for_file: prefer_const_constructors

import 'package:chatappp/component/my_drawer.dart';
import 'package:chatappp/component/user_tile.dart';
import 'package:chatappp/pages/chat_page.dart';
import 'package:chatappp/services/auth/auth_service.dart';
import 'package:chatappp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  // chat & auth service
  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

// built a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return Text("Error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading..");
        }
        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for the user
  Widget  _buildUserListItem(Map<String,dynamic> userData,  BuildContext context){
    // display all the user except the current user
    if(userData["email"]!= _authService.getCurrentUser()!.email){
      return UserTile(
      text: userData["email"],
      onTap: (){
        // tapped on a user then go to the chat page
        Navigator.push(context, 
        MaterialPageRoute(builder:(context) => ChatPage(
          receiverEmail: userData["email"], receiverID: userData["uid"],)));
      },
    );
    }else{
      return Container();
    }
  }
}
