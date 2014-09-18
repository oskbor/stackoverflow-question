part of lims;
class Sample {
  String name;
  String _id;
  Map<Attribute, dynamic> attributeValues;
  Map<Parameter, Result> parameterResults;
  
  Sample(this._id, this.name, this.attributeValues, this. parameterResults);
  
  
  
}

class Result {
  Parameter param;
  List<num> _rawData;
  num get result{
    num sum;
    _rawData.forEach((num n){if (n != null) sum += n;});
    return sum / _rawData.length;   
  }
  void addRawData(num raw) {
    _rawData.add(raw);
  }
  
}