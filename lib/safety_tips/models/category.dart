class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Self-Awarnesss',
    noOfCourses: 5,
    thumbnail: 'assets/image1.png',
  ),
  Category(
    name: 'Self-Defence',
    noOfCourses: 5,
    thumbnail: 'assets/image2.jpg',
  ),
  Category(
    name: 'Report Issues',
    noOfCourses: 5,
    thumbnail: 'assets/image4.jpg',
  ),
  /*Category(
    name: 'I',
    noOfCourses: 5,
    thumbnail: 'assets/icons/design.jpg',
  ),*/
];
