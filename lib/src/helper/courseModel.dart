class CourseModel {
  String name;
  String description;
  String university;
  String tag1;
  String tag2;

  CourseModel(
      {this.name,
      this.description,
      this.university,
      this.tag1,
      this.tag2});
}

class CourseList {
  static List<CourseModel> list = [
    CourseModel(
        name: "Samsung Smart TV",
        description: "Samsung 49 inch Smart TV with android",
        university: "By Haztech",
        tag1: "Electronics",
        tag2: "TV"),
    CourseModel(
        name: "Gift Vouchers",
        description: "Gift Vouchers worth 5000 euros",
        university: "By Haztech",
        tag1: "Gift Cards",
        tag2: "Shopping"),
    CourseModel(
        name: "Iphone X",
        description: "Win Iphone X worth 99 Dollars",
        university: "By Haztech",
        tag1: "Mobile",
        tag2: "ELectronics"),
  ];
}
