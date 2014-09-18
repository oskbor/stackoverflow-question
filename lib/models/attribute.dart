part of lims;

class Attribute {
  String id;
  String name;
  List<Attribute> children;
  Attribute(this.id,this.name, [this.children]);
  
}