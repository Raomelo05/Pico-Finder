class Pico {
  final String imageUrl;
  final String name;
  final String type;
  final double rating;
  final String location;
  final String level;
  final String description;

  const Pico({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.rating,
    required this.location,
    required this.level,
    required this.description,
  });


 factory Pico.fromJson(Map<String, dynamic> json) {
    return Pico(
      imageUrl: json['imageUrl'],
      name: json['name'],
      type: json['type'],
      rating: (json['rating'] as num).toDouble(),
      location: json['location'],
      level: json['level'],
      description: json['description'],
    );
 }
  Map<String,dynamic> toJson(){
    return{
      'imageUrl':imageUrl,
      'name':name,
      'type': type,
      'rating':rating,
      'location':location,
      'level':level,
      'description':description,
    };

 }

}


