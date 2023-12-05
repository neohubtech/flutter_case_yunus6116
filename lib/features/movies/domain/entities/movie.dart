import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? imageUrl;
  final String? type;
  final String? name;
  final String? explanation;

  const MovieEntity({
    this.imageUrl,
    this.type,
    this.name,
    this.explanation,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        type,
        name,
        explanation,
      ];
}
