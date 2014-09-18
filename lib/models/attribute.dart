part of lims;

class Attribute {
  static int STRING = 1;
  static int NUMBER = 2;
  static int DATE   = 3;
  String id;
  String name;
  int _type;
  List<Attribute> children;
  Attribute(this.id,this.name,this._type, [this.children]);
  
  factory Attribute.fromJson(Map<String, dynamic> json){
    List<Map<String, dynamic>> jsonChildren = json['children'];
    List<Attribute> children =[];
    if( jsonChildren != null){
      jsonChildren.forEach((child){
        children.add(new Attribute.fromJson(child));
      });
    }
    return new Attribute(json['id'],json['name'], json['type'], children);
  }
}