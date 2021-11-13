import 'package:flutter/material.dart';
import 'package:test_app/network/api.dart';
import 'package:http/http.dart' as http;

class AddCommentBottomSheet extends StatefulWidget {
  const AddCommentBottomSheet(
    this.postId, {
    Key key,
  }) : super(key: key);
  final int postId;
  @override
  _AddCommentBottomSheetState createState() => _AddCommentBottomSheetState();
}

class _AddCommentBottomSheetState extends State<AddCommentBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  bool isSendingComment = false;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add a comment',
                  style: TextStyle(fontSize: 20.0),
                ),
                buildUsername(),
                buildEmail(),
                buildComment(),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              commentController.text.isNotEmpty &&
                              !isSendingComment) {
                            sendComment(
                                nameController.text,
                                emailController.text,
                                commentController.text,
                                widget.postId);
                          }
                        },
                        child: Text('SEND')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('CANCEL'))
                  ],
                )
              ],
            )));
  }

  void sendComment(
      String name, String email, String comment, int postId) async {
    String url = Api.baseApi + 'posts/' + '$postId/comments';
    final Map<String, String> body = {
      'name': name,
      'email': email,
      'body': comment,
    };
    setState(() {
      isSendingComment = true;
    });
    final request = await http.post(url, body: body);
    if (request.statusCode == 201) {
      print(request.body);
      showCommentSendDialog('Comment added!');
    } else {
      showCommentSendDialog('Comment not added!');
      print(request.body);
    }
    setState(() {
      isSendingComment = false;
    });
  }

  Future showCommentSendDialog(String text) {
    return showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  Widget buildUsername() => TextFormField(
        controller: nameController,
        decoration: InputDecoration(labelText: 'Name'),
        validator: (value) {
          if (value.length < 2) {
            return 'Name must be at least 2 characters';
          } else {
            return null;
          }
        },
      );
  Widget buildEmail() => TextFormField(
        controller: emailController,
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value.length < 6) {
            return 'Email must be at least 6 characters';
          } else {
            return null;
          }
        },
      );
  Widget buildComment() => TextFormField(
        controller: commentController,
        decoration: InputDecoration(labelText: 'Comment'),
        validator: (value) {
          if (value.length < 1) {
            return 'Comment must be at least 1 characters';
          } else {
            return null;
          }
        },
      );
}
