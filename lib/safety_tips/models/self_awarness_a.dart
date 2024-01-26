class Course {
  String name;

  String thumbnail;

  Course({

    required this.name,
    required this.thumbnail,
  });
}
List<Course> courses = [
  Course(
    name: "Recognizing Emotional Triggers",
    thumbnail: "assets/emotion.jpg",
  ),
  Course(
    name: "Identifying Your Values",
    thumbnail: "assets/identity.jpg",
  ),
  Course(

    name: "Self-Advocacy",
    thumbnail: "assets/self.jpg",
  ),
  Course(

    name: "Recognizing Strengths and Weaknesses",
    thumbnail: "assets/streweak.jpg",
  ),
  Course(

    name: "Confidence from Within",
    thumbnail: "assets/confident.jpg",
  ),
  /*Course(

    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),*/
];
