part of lims;
class Study {
  String name;
  String _id;
  List<Attribute> selected_attributes;
  Study(this._id,this.name, this.selected_attributes);
  
  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": _id,
    "name": name,
    "selected_attributes": selected_attributes
  };

  Study.fromJson(Map<String, dynamic> json) : this(json['_id'],
      json['name'], json['selected_attributes']);
}

