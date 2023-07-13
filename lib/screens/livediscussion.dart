import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DiscussionForumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/frame6.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            title: Text('Discussion Forum'),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 15, 16, 10),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('posts')
                            .orderBy('timestamp', descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (!snapshot.hasData) {
                            return Center(
                              child: Text('No posts available.'),
                            );
                          }

                          final posts = snapshot.data!.docs;

                          return ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              final post =
                              posts[index].data() as Map<String, dynamic>;
                              final authorEmail = post['authorEmail'];
                              final content = post['content'];
                              post['timestamp'] as Timestamp;
                              final viewCount = post['viewCount'];
                              final likeCount = post['likeCount'] ?? 0;
                              final replyCount = post['replyCount'] ?? 0;
                              final imageUrl = post['imageUrl'];

                              final timestamp = post['timestamp'] as Timestamp?;
                              final dateTime = timestamp?.toDate();
                              final formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(dateTime!);
                              final formattedTime = DateFormat('HH:mm').format(
                                  dateTime!);

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          PostDetailsScreen(
                                            postId: posts[index].id,
                                          ),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: EdgeInsets.only(bottom: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 3,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(16, 14, 16, 14),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _getPreviewText(content),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 9),
                                        if (imageUrl != null)
                                          Container(
                                            height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(imageUrl),
                                                fit: BoxFit.contain,
                                                onError: (_, __) => ErrorWidget('Image not available'),
                                              ),
                                            ),
                                          ),




                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 16,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Posted by: $authorEmail',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 16,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Posted on: $formattedDate at $formattedTime',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                                 ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.remove_red_eye,
                                              size: 16,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Views: $viewCount',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.thumb_up,
                                              size: 16,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Likes: $likeCount',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.reply,
                                              size: 16,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Replies: $replyCount',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  PostInputField(),
                ],
              ),
            ],
          ),
        )
    );
  }


  String _getPreviewText(String content) {
    if (content.length <= 100) {
      return content;
    } else {
      return content.substring(0, 100) + '...';
    }
  }
}

class PostInputField extends StatefulWidget {
  @override
  _PostInputFieldState createState() => _PostInputFieldState();
}

class _PostInputFieldState extends State<PostInputField> {
  final TextEditingController _postController = TextEditingController();
  File? _selectedImage;

  Future<void> _addPost() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String authorEmail = user!.email!;
    final String postContent = _postController.text.trim();

    if (postContent.isNotEmpty) {
      final DateTime currentTime = DateTime.now();
      final Timestamp timestamp = Timestamp.fromDate(currentTime);

      final post = {
        'authorEmail': authorEmail,
        'content': postContent,
        'timestamp': timestamp,
        'viewCount': 0,
        'likeCount': 0,
        'replyCount': 0,
      };

      final postRef = await FirebaseFirestore.instance.collection('posts').add(post);

      if (_selectedImage != null) {
        final String imageName = postRef.id + '.jpg';
        final Reference storageRef = FirebaseStorage.instance.ref().child('post_images').child(imageName);
        await storageRef.putFile(_selectedImage!);
        final String imageUrl = await storageRef.getDownloadURL();

        await postRef.update({'imageUrl': imageUrl});
      }

      _postController.clear();
      setState(() {
        _selectedImage = null;
      });
    }
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Select Image Source'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallery'),
                onTap: () async {
                  Navigator.of(context).pop(await imagePicker.pickImage(source: ImageSource.gallery));
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop(await imagePicker.pickImage(source: ImageSource.camera));
                },
              ),
            ],
          ),
        ),
      ),
    );

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_selectedImage != null)
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(_selectedImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _postController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Enter your post...',
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: _pickImage,
                    icon: Icon(Icons.image),
                  ),
                  ElevatedButton(
                    onPressed: _addPost,
                    child: Text('Post'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          )
    ]
        )
    );
  }
}
class PostDetailsScreen extends StatefulWidget {
  final String postId;

  const PostDetailsScreen({required this.postId});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final TextEditingController _replyController = TextEditingController();
  final CollectionReference _postsCollection =
  FirebaseFirestore.instance.collection('posts');

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Increment the view count when the screen is displayed
    _addView();
    // _addLike();
  }

  void _addReply() {
    final String replyContent = _replyController.text.trim();

    if (replyContent.isNotEmpty) {
      _postsCollection.doc(widget.postId).update({
        'replies': FieldValue.arrayUnion([
          {
            'content': replyContent,
            'authorEmail': FirebaseAuth.instance.currentUser!.email,
            'timestamp': Timestamp.now(),
          }
        ]),
        'replyCount': FieldValue.increment(1),
      }).then((_) {
        _replyController.clear();
      }).catchError((error) {
        // Handle error while adding reply
        print('Error adding reply: $error');
      });
    }
  }
  void _addView() {
    _postsCollection.doc(widget.postId).update({
      'viewCount': FieldValue.increment(1),
    }).catchError((error) {
      // Handle error while adding view
      print('Error adding view: $error');
    });
  }

  void _addLike() {
    _postsCollection
        .doc(widget.postId)
        .update({
      'likeCount': FieldValue.increment(1),
    })
        .catchError((error) {
      // Handle error while adding like
      print('Error adding like: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE9FFEB),
              Color(0xFF00D719),

            ],
          ),
        ),
    child: Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body : Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color(0xFFE9FFEB),
        //       Color(0xFF87E392),
        //
        //     ],
        //   ),
        // ),
      child: StreamBuilder<DocumentSnapshot>(
        stream: _postsCollection.doc(widget.postId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final post = snapshot.data!.data() as Map<String, dynamic>;
          final authorEmail = post['authorEmail'];
          final content = post['content'];
          // final timestamp = post['timestamp'] as Timestamp;
          final viewCount = post['viewCount'];
          final likeCount = post['likeCount'] ?? 0;
          final replyCount = post['replyCount'] ?? 0;
          final timestamp = post['timestamp'] as Timestamp?;
          final dateTime = timestamp?.toDate();
          final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime!);
          final formattedTime = DateFormat('HH:mm').format(dateTime!);
          // final dateTime = timestamp.toDate();
          final imageUrl = post['imageUrl'];

          final replies = post['replies'] as List<dynamic>? ?? [];

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Container(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageUrl != null)
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Posted by: $authorEmail',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Posted on: ${formattedDate.toString()}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: 16,
                      color: Colors.grey[600],
                    ),

                    SizedBox(width: 5),
                    Text(
                      'Views: $viewCount',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                         icon: Icon(Icons.thumb_up),
                      onPressed: _addLike,
                      iconSize: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 0),
                    Text(
                      'Likes: $likeCount',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    // Like Button
                    // IconButton(
                    //   icon: Icon(Icons.thumb_up),
                    //   onPressed: _addLike,
                    // ),

                    SizedBox(width: 20),
                    Icon(
                      Icons.reply,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Replies: $replyCount',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Replies:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: replies.length,
                  itemBuilder: (context, index) {
                    final reply = replies[index];
                    final replyContent = reply['content'];
                    final replyAuthorEmail = reply['authorEmail'];


                    return Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          replyContent,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[1000],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Reply from: $replyAuthorEmail',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),Text(
                          'Posted by: $formattedTime',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                ),
                SizedBox(height: 0),
                TextField(
                  controller: _replyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your reply',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addReply,
                  child: Text('Add Reply'),
                ),
              ],
            ),
            )
          );
        },
      ),
      )
    )
    );

  }
}