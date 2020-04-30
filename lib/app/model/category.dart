
class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {"name": "Professor", 'courses': 17, 'image': "assets/images/professor.png"},
  {"name": "Aluno", 'courses': 25, 'image': "assets/images/aluno.png"},
  {
    "name": "Atividades",
    'courses': 13,
    'image': "assets/images/forms.png"
  },
  {"name": "Playlist", 'courses': 2, 'image': "assets/images/playlist.png"},
];
