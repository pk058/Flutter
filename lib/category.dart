class Category{
  final String sub;
  final String topic;
  final  String date;
  final String imgurl;

  Category(this.sub, this.topic, this.date, this.imgurl);
}

List<Category> newAssingment = newAssingmentData.map((item) => Category(item["sub"], item["topic"], item["date"], item["imgurl"])).toList();
List<Category> pendingAssingment = pendingAssingmentData.map((item) => Category(item["sub"], item["topic"], item["date"], item["imgurl"])).toList();

var newAssingmentData = [
  {"sub": "Physics", "topic": "Electromagnetism", "date":"20/08/20", "imgurl": ""},
  {"sub": "Chemistry", "topic": "Alkyl Halides", "date":"20/08/20", "imgurl": ""},
];

var pendingAssingmentData = [
  {"sub": "Physics", "topic": "Mechanics", "date":"20/08/20", "imgurl": ""},
  {"sub": "Chemistry", "topic": "Aromatic", "date":"20/08/20", "imgurl": ""},
];