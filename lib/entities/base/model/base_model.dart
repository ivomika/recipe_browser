import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable{
  final String id;
  final DateTime createdAt;

  const BaseModel({
    required this.id,
    required this.createdAt
  });

  BaseModel.create() :
      id = '',
      createdAt = DateTime.now();

  @override
  List<Object?> get props => [id, createdAt];
}