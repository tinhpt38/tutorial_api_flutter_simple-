

class ColorProduct{
    final int id;
  final String name; 
  final String code;

  ColorProduct({this.id, this.name, this.code});


   ColorProduct.fromJson(Map<String, dynamic> json):
  this.id = json['id'],
  this.name = json['name'],
  this.code = json['code'];

  Map<String, dynamic> toJson() => {
    'id':this.id,
    'name':this.name,
    'code':this.code
  };

}