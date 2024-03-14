class Message {
  final String msg;
  final String uid;
  final DateTime time;
  Message(this.msg, this.uid, this.time);

  factory Message.fromJson(jsonData) {
    return Message(jsonData['msg'], jsonData['uid'], jsonData['time'].toDate());
  }
}
