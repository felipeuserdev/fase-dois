import 'level.dart';

class Categories {
  String categoryName = "";
  List<Level> levels = [];

  Categories({this.categoryName = "", this.levels  = const []});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    if (json['level'] != null) {
      levels = <Level>[];
      json['level'].forEach((v) {
        levels.add(Level.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryName'] = categoryName;
    data['level'] = levels.map((v) => v.toJson()).toList();
      return data;
  }
}
