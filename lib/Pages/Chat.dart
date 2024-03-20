import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmonkey/models/Message.dart';
import 'package:foodmonkey/models/ImagRes.dart';
import 'package:foodmonkey/utils/Constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
//   List<Map<String, String>> chats = [
// { "from":"Mg Mg", "to":"Aung Aung", "msg":"How are you?",  "type":"text", "created":"20-2-2020", },
// { "from":"Aung Aung", "to":"Mg Mg", "msg":"Hope you are Well",  "type":"text", "created":"20-2-2020", },
// { "from":"Mg Mg", "to":"Aung Aung", "msg":Constants.sampleImage,  "type":"image", "created":"20-2-2020", },
// { "from":"Aung Aung", "to":"Mg Mg", "msg":"Hope you are Well",  "type":"text", "created":"20-2-2020", },
//   ];

  // ( flutter pub add image_picker )
  // flutter pub add socket_io_client

  List<Message> chats = [];
  final _chatInputController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  final picker = ImagePicker();
  File? _image;

  invokeSocket() {
    Constants.socket?.on("message", (data) {
      // print(data);
      Message msg = Message.fromJson(data);
      chats.add(msg);
      setState(() {
        // auto go down to new message
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 350,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn);
      });
    });

    // Constants.socket?.emit("load");
    Constants.socket?.on("messages", (data) {
      List lisy = data as List;
      print(lisy);
      chats = lisy.map((e) => Message.fromJson(e)).toList();
      setState(() {
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 350,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn);
      });
    });
  }

  _emitMessage(msg, type) {
    var sendMsg = new Map();
    sendMsg["from"] = Constants.user?.id;
    sendMsg["to"] = Constants.shopId;
    sendMsg["msg"] = msg;
    sendMsg["type"] = type;
    Constants.socket?.emit("message", sendMsg);
  }

  @override
  void initState() {
    super.initState();
    invokeSocket();
  }

  @override
  Widget build(BuildContext context) {
    var msize = (MediaQuery.of(context).size.width / 3) * 2;
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: chats.length,
                    itemBuilder: (context, index) =>
                        // ( Text(chats[index]['from'] ?? "" ))
                        chats[index].from?.name == Constants.user?.name
                            ? _leftUser(msize, chats[index])
                            : _rightUser(msize, chats[index]))),
            Container(
              height: 40,
              decoration: BoxDecoration(color: Constants.normal),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  InkWell(
                      onTap: () => getImage(),
                      child: Icon(Icons.file_copy,
                          size: 35, color: Constants.primary)),
                  Expanded(
                      child: TextFormField(
                    controller: _chatInputController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Constants.primary))),
                  )),
                  InkWell(
                      onTap: () =>
                          _emitMessage(_chatInputController.text, "text"),
                      child:
                          Icon(Icons.send, size: 35, color: Constants.primary)),
                ],
              ),
            )
          ],
        ));
  }

  // multipath data to Server
  uploadImaegNow() async {
    var postUri = Uri.parse(Constants.GALLERY_URL);
    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath("photo", _image?.path ?? "");
    request.files.add(multipartFile);
    request.headers.addAll(Constants.tokenHeader);

    // upload to server
    await request.send().then((response) async {
      // if success, reuse
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode(value);
        ImgRes imageRes = ImgRes.fromJson(resData["result"]);
        _emitMessage(imageRes.link, "image");
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    _image = File(pickedImage?.path ?? "");
    uploadImaegNow();
  }

  Widget _leftUser(msize, Message chat) {
    return chat.type == "text"
        ? _buildLeftChatBox(msize, chat)
        : _buildLeftImage(msize, chat.msg);
  }

  Widget _rightUser(msize, Message chat) {
    return chat.type == "text"
        ? _buildRightChatBox(msize, chat)
        : _buildRightImage(msize, chat.msg);
  }

  Widget _buildLeftChatBox(msize, chat) {
    return Row(
      children: [
        Container(
          width: msize,
          margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Constants.secondary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.from.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(chat.msg,
                  style: TextStyle(fontSize: 13, color: Constants.normal)),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(chat.created, style: TextStyle(color: Constants.primary))
              ])
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightChatBox(msize, chat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: msize,
          margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Constants.accent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.from.name,
                style: TextStyle(
                    color: Constants.primary, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(chat.msg,
                  style: TextStyle(fontSize: 13, color: Constants.normal)),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(chat.created, style: TextStyle(color: Constants.primary))
              ])
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeftImage(msize, var image) {
    return Row(children: [
      Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.all(10),
          width: msize,
          decoration: BoxDecoration(
              color: Constants.darkGrey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.network(Constants.getImageLink(image)))
    ]);
  }

  Widget _buildRightImage(msize, var image) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.all(10),
          width: msize,
          decoration: BoxDecoration(
              color: Constants.darkGrey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.network(Constants.getImageLink(image)))
    ]);
  }
}
