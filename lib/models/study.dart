part of lims;
class Study {
  String name;
  String id;
  List<Attribute> selected_attributes;
  Study(this.id,this.name, this.selected_attributes);
  
  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "name": name,
    "selected_attributes": selected_attributes
  };

  Study.fromJson(Map<String, dynamic> json) : this(json['_id'],
      json['name'], json['selected_attributes']);
}

