part of lims;
class Study {
  String name;
  String description;
  String id;
  List<Attribute> selected_attributes;
  int samples;
  
  Study(this.id,this.name, this.description, this.samples, this.selected_attributes);
  
  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "name": name,
    "samples": samples,
    "description": description,
    "selected_attributes": selected_attributes
  };

  Study.fromJson(Map<String, dynamic> json) : this(json['id'],
      json['name'],json['description'], json['samples'], json['selected_attributes']);
  
  Study.fromTemplate(Study s): this(null, s.name,s.description, s.samples, s.selected_attributes);
}

