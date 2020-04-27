class JSONParseable{
  JSONParseable();
  factory JSONParseable.fromJSON(Map<String, dynamic> json){
    return JSONParseable();
  }
  dynamic fromJSON(Map<String, dynamic> json){
    return JSONParseable.fromJSON(json);
  }
}