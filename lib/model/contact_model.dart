class ContactModel {
  String name;
  String number;
  String email;
  ContactModel(this.name, this.number, this.email);
  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    email = json['email'];
  }
}
