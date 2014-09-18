part of lims;

class Attribute {
  String _id;
  String name;
  List<Attribute> children;
  Attribute(this._id,this.name, [this.children]);
  
}