class Note {
  String name;
  String categories;
   String description;
   String images;

  Note(this.name, this.categories, this.description, this.images);

  Note.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    categories = json['Categories'];
    description= json["Short description"];
    images= json["Images"]
;  }
}