class Message {
  String? id, msg, type, created;

  MsgFrom? from;
  MsgFrom? to;

  Message({this.id, this.msg, this.type, this.created, this.from, this.to});

  factory Message.fromJson(dynamic data) {
    MsgFrom f = MsgFrom.fromJson(data['from']);
    MsgFrom t = MsgFrom.fromJson(data['to']);
    return Message(
        id: data["_id"],
        msg: data["msg"],
        type: data["type"],
        created: data["created"],
        from: f,
        to: t);
  }
}

class MsgFrom {
  String? id, name;
  MsgFrom({this.id, this.name});

  factory MsgFrom.fromJson(dynamic data) {
    return MsgFrom(id: data["_id"], name: data["name"]);
  }
}
