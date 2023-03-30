class ApiModel {
  int id;
  int userId;
  String title;
  String body;

  ApiModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
        id: map['id'] as int,
        userId: map['userId'] as int,
        title: map['title'] as String,
        body: map['body'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'title': this.title,
      'body': this.body,
    } as Map<String, dynamic>;
  }
}
