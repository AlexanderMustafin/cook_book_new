class Category {
  final String displayName; 
  final String iconImage; 
  final String tag;

  Category({required this.displayName, required this.iconImage, required this.tag}); 

  factory Category.fromJson(dynamic json) {
    return Category(
      displayName: json['displayName'] as String,
      iconImage: json['iconImage'] as String, 
      tag: json['tag'] as String,
      );
  }

  static List<Category> categoriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Category.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Category {name: $displayName, image: $iconImage, tag: $tag}';
  }

}