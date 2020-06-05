class Category {
  final int id;
  final String name;
  final String image;
  final dynamic child;

  Category({this.id, this.name, this.image, this.child});

  Category.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.image = json['image'],
        this.child = json['child'];

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'image': this.image,
        'child': this.child
      };
}
