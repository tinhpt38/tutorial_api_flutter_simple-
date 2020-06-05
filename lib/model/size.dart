

class SizeProduct{
  final int id;
  final String name; 


  SizeProduct({this.id, this.name});

  SizeProduct.formJson(Map<String, dynamic> json):
  this.id = json['id'],
  this.name = json['name'];

  Map<String, dynamic> toJson() => {
    'id':this.id,
    'name':this.name
  };

}