import 'package:floor/floor.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/movie.dart';

/// Movie Model
@Entity(tableName: 'movies', primaryKeys: ["name"])
class MovieModel extends MovieEntity {
  const MovieModel({
    String? imageUrl,
    String? type,
    String? name,
    String? explanation,
  }) : super(
          imageUrl: imageUrl,
          type: type,
          name: name,
          explanation: explanation,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      imageUrl: json['imageUrl'] != null && json["imageUrl"] != "" ? json['imageUrl'] : kDefaultImage,
      type: json['type'],
      name: json['name'],
      explanation: json['explanation'],
    );
  }

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      imageUrl: entity.imageUrl,
      type: entity.type,
      name: entity.name,
      explanation: entity.explanation,
    );
  }
}
