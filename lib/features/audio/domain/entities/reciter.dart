import 'package:equatable/equatable.dart';

class Reciter extends Equatable {
  final String identifier;
  final String name;
  final String englishName;
  final String format;
  final String type;

  const Reciter({
    required this.identifier,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  @override
  List<Object> get props => [identifier, name];
}
