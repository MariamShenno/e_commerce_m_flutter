import 'package:equatable/equatable.dart';

class OnBoardingEntity extends Equatable {
  final String title;
  final String description;
  final String images;

  const OnBoardingEntity({
    required this.title,
    required this.description,
    required this.images,
  });

  @override
  List<Object?> get props => [title, description, images];
}
