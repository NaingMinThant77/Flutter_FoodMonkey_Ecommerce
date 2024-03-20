class Tag {
  String? id, name, image;

  Tag({required this.id, required this.name, required this.image});

  factory Tag.fromJson(dynamic data) {
    return Tag(id: data['_id'],name: data['name'], image: data['image']);
  }
}

// {_id: 605c4d6d184b7b1136d4ec43, 
//name: Popular, 
//image: uploads/8_1616675537280.png, 
//created: 2021-03-25T08:44:29.184Z, //not need 
//updated: 2021-03-25T08:44:29.184Z} //not need 
