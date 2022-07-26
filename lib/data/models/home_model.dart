class FirstSection {
  String titleFirstSection;
  String bodyFirstSection;

  FirstSection(this.titleFirstSection, this.bodyFirstSection);

  // FirstSection.fromJson(Map<String, dynamic> json){
  //   titleFirstSection = json[''];
  //   bodyFirstSection = json[''];
  // }
  //
  // Map<String, dynamic> toJson(){
  //
  // }
}

class SecondSection {
  String title;
  String body;
  SecondSection(this.title, this.body);
}


class Footer {
  String email;
  String location;
  String location2;
  String phone;

  Footer(this.email, this.location, this.location2, this.phone);
}

class PetsNeeds {
  String? imageUrl;
  String? title;

  PetsNeeds(this.imageUrl, this.title);

  PetsNeeds.fromJson(Map<String, dynamic> json){
    imageUrl = json['imageUrl'];
    title = json['title'];
}



}
