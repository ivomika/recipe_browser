import 'package:equatable/equatable.dart';

class BaseModel extends Equatable{
  final String id;
  final DateTime createdAt;

  const BaseModel({
    required this.id,
    required this.createdAt
  });

  @override
  List<Object?> get props => [id, createdAt];
}