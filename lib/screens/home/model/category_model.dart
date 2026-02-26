class CategoryModel {
  final String name;
  final String image;
  final String time;
  final String discription;
  final double rate;

  CategoryModel({
    required this.name,
    required this.image,
    required this.time,
    required this.discription,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'time': time,
      'discription': discription,
      'rate': rate,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      image: map['image'] as String,
      time: map['time'] as String,
      discription: map['discription'] as String,
      rate: (map['rate'] as num).toDouble(),
    );
  }
}