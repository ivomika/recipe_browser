// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_app_database.dart';

// ignore_for_file: type=lint
class $RecipeTableTable extends RecipeTable
    with TableInfo<$RecipeTableTable, RecipeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => Uuid().v4());
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cookingTimeMeta =
      const VerificationMeta('cookingTime');
  @override
  late final GeneratedColumn<int> cookingTime = GeneratedColumn<int>(
      'cooking_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kilocaloriesMeta =
      const VerificationMeta('kilocalories');
  @override
  late final GeneratedColumn<int> kilocalories = GeneratedColumn<int>(
      'kilocalories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _servingsMeta =
      const VerificationMeta('servings');
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
      'servings', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
      'difficulty', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        createdAt,
        title,
        description,
        cookingTime,
        kilocalories,
        servings,
        difficulty
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_table';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cooking_time')) {
      context.handle(
          _cookingTimeMeta,
          cookingTime.isAcceptableOrUnknown(
              data['cooking_time']!, _cookingTimeMeta));
    } else if (isInserting) {
      context.missing(_cookingTimeMeta);
    }
    if (data.containsKey('kilocalories')) {
      context.handle(
          _kilocaloriesMeta,
          kilocalories.isAcceptableOrUnknown(
              data['kilocalories']!, _kilocaloriesMeta));
    } else if (isInserting) {
      context.missing(_kilocaloriesMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(_servingsMeta,
          servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta));
    } else if (isInserting) {
      context.missing(_servingsMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      cookingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cooking_time'])!,
      kilocalories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kilocalories'])!,
      servings: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}servings'])!,
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficulty'])!,
    );
  }

  @override
  $RecipeTableTable createAlias(String alias) {
    return $RecipeTableTable(attachedDatabase, alias);
  }
}

class RecipeTableData extends DataClass implements Insertable<RecipeTableData> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final String title;
  final String description;
  final int cookingTime;
  final int kilocalories;
  final int servings;
  final String difficulty;
  const RecipeTableData(
      {required this.id,
      required this.uuid,
      required this.createdAt,
      required this.title,
      required this.description,
      required this.cookingTime,
      required this.kilocalories,
      required this.servings,
      required this.difficulty});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['cooking_time'] = Variable<int>(cookingTime);
    map['kilocalories'] = Variable<int>(kilocalories);
    map['servings'] = Variable<int>(servings);
    map['difficulty'] = Variable<String>(difficulty);
    return map;
  }

  RecipeTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      title: Value(title),
      description: Value(description),
      cookingTime: Value(cookingTime),
      kilocalories: Value(kilocalories),
      servings: Value(servings),
      difficulty: Value(difficulty),
    );
  }

  factory RecipeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      cookingTime: serializer.fromJson<int>(json['cookingTime']),
      kilocalories: serializer.fromJson<int>(json['kilocalories']),
      servings: serializer.fromJson<int>(json['servings']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'cookingTime': serializer.toJson<int>(cookingTime),
      'kilocalories': serializer.toJson<int>(kilocalories),
      'servings': serializer.toJson<int>(servings),
      'difficulty': serializer.toJson<String>(difficulty),
    };
  }

  RecipeTableData copyWith(
          {int? id,
          String? uuid,
          DateTime? createdAt,
          String? title,
          String? description,
          int? cookingTime,
          int? kilocalories,
          int? servings,
          String? difficulty}) =>
      RecipeTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        description: description ?? this.description,
        cookingTime: cookingTime ?? this.cookingTime,
        kilocalories: kilocalories ?? this.kilocalories,
        servings: servings ?? this.servings,
        difficulty: difficulty ?? this.difficulty,
      );
  RecipeTableData copyWithCompanion(RecipeTableCompanion data) {
    return RecipeTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      cookingTime:
          data.cookingTime.present ? data.cookingTime.value : this.cookingTime,
      kilocalories: data.kilocalories.present
          ? data.kilocalories.value
          : this.kilocalories,
      servings: data.servings.present ? data.servings.value : this.servings,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('kilocalories: $kilocalories, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, createdAt, title, description,
      cookingTime, kilocalories, servings, difficulty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.description == this.description &&
          other.cookingTime == this.cookingTime &&
          other.kilocalories == this.kilocalories &&
          other.servings == this.servings &&
          other.difficulty == this.difficulty);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<String> title;
  final Value<String> description;
  final Value<int> cookingTime;
  final Value<int> kilocalories;
  final Value<int> servings;
  final Value<String> difficulty;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.kilocalories = const Value.absent(),
    this.servings = const Value.absent(),
    this.difficulty = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String title,
    required String description,
    required int cookingTime,
    required int kilocalories,
    required int servings,
    required String difficulty,
  })  : title = Value(title),
        description = Value(description),
        cookingTime = Value(cookingTime),
        kilocalories = Value(kilocalories),
        servings = Value(servings),
        difficulty = Value(difficulty);
  static Insertable<RecipeTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? cookingTime,
    Expression<int>? kilocalories,
    Expression<int>? servings,
    Expression<String>? difficulty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (cookingTime != null) 'cooking_time': cookingTime,
      if (kilocalories != null) 'kilocalories': kilocalories,
      if (servings != null) 'servings': servings,
      if (difficulty != null) 'difficulty': difficulty,
    });
  }

  RecipeTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<DateTime>? createdAt,
      Value<String>? title,
      Value<String>? description,
      Value<int>? cookingTime,
      Value<int>? kilocalories,
      Value<int>? servings,
      Value<String>? difficulty}) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      cookingTime: cookingTime ?? this.cookingTime,
      kilocalories: kilocalories ?? this.kilocalories,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cookingTime.present) {
      map['cooking_time'] = Variable<int>(cookingTime.value);
    }
    if (kilocalories.present) {
      map['kilocalories'] = Variable<int>(kilocalories.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('kilocalories: $kilocalories, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }
}

class $CookingStepTableTable extends CookingStepTable
    with TableInfo<$CookingStepTableTable, CookingStepTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookingStepTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recipe_table (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, description, recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cooking_step_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CookingStepTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CookingStepTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookingStepTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id'])!,
    );
  }

  @override
  $CookingStepTableTable createAlias(String alias) {
    return $CookingStepTableTable(attachedDatabase, alias);
  }
}

class CookingStepTableData extends DataClass
    implements Insertable<CookingStepTableData> {
  final int id;
  final DateTime createdAt;
  final String description;
  final int recipeId;
  const CookingStepTableData(
      {required this.id,
      required this.createdAt,
      required this.description,
      required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['description'] = Variable<String>(description);
    map['recipe_id'] = Variable<int>(recipeId);
    return map;
  }

  CookingStepTableCompanion toCompanion(bool nullToAbsent) {
    return CookingStepTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      description: Value(description),
      recipeId: Value(recipeId),
    );
  }

  factory CookingStepTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookingStepTableData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      description: serializer.fromJson<String>(json['description']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'description': serializer.toJson<String>(description),
      'recipeId': serializer.toJson<int>(recipeId),
    };
  }

  CookingStepTableData copyWith(
          {int? id, DateTime? createdAt, String? description, int? recipeId}) =>
      CookingStepTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        description: description ?? this.description,
        recipeId: recipeId ?? this.recipeId,
      );
  CookingStepTableData copyWithCompanion(CookingStepTableCompanion data) {
    return CookingStepTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      description:
          data.description.present ? data.description.value : this.description,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CookingStepTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('description: $description, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, description, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookingStepTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.description == this.description &&
          other.recipeId == this.recipeId);
}

class CookingStepTableCompanion extends UpdateCompanion<CookingStepTableData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> description;
  final Value<int> recipeId;
  const CookingStepTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.description = const Value.absent(),
    this.recipeId = const Value.absent(),
  });
  CookingStepTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String description,
    required int recipeId,
  })  : description = Value(description),
        recipeId = Value(recipeId);
  static Insertable<CookingStepTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? description,
    Expression<int>? recipeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (description != null) 'description': description,
      if (recipeId != null) 'recipe_id': recipeId,
    });
  }

  CookingStepTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<String>? description,
      Value<int>? recipeId}) {
    return CookingStepTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      recipeId: recipeId ?? this.recipeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookingStepTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('description: $description, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }
}

class $CountTypeTableTable extends CountTypeTable
    with TableInfo<$CountTypeTableTable, CountTypeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountTypeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => Uuid().v4());
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, uuid, createdAt, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'count_type_table';
  @override
  VerificationContext validateIntegrity(Insertable<CountTypeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountTypeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountTypeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CountTypeTableTable createAlias(String alias) {
    return $CountTypeTableTable(attachedDatabase, alias);
  }
}

class CountTypeTableData extends DataClass
    implements Insertable<CountTypeTableData> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final String name;
  const CountTypeTableData(
      {required this.id,
      required this.uuid,
      required this.createdAt,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    return map;
  }

  CountTypeTableCompanion toCompanion(bool nullToAbsent) {
    return CountTypeTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      name: Value(name),
    );
  }

  factory CountTypeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountTypeTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
    };
  }

  CountTypeTableData copyWith(
          {int? id, String? uuid, DateTime? createdAt, String? name}) =>
      CountTypeTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
      );
  CountTypeTableData copyWithCompanion(CountTypeTableCompanion data) {
    return CountTypeTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountTypeTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, createdAt, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountTypeTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.name == this.name);
}

class CountTypeTableCompanion extends UpdateCompanion<CountTypeTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<String> name;
  const CountTypeTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
  });
  CountTypeTableCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CountTypeTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
    });
  }

  CountTypeTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<DateTime>? createdAt,
      Value<String>? name}) {
    return CountTypeTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountTypeTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $IngredientTableTable extends IngredientTable
    with TableInfo<$IngredientTableTable, IngredientTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<double> count = GeneratedColumn<double>(
      'count', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeUuidMeta =
      const VerificationMeta('typeUuid');
  @override
  late final GeneratedColumn<String> typeUuid = GeneratedColumn<String>(
      'type_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES count_type_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recipe_table (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, name, count, typeUuid, recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<IngredientTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('type_uuid')) {
      context.handle(_typeUuidMeta,
          typeUuid.isAcceptableOrUnknown(data['type_uuid']!, _typeUuidMeta));
    } else if (isInserting) {
      context.missing(_typeUuidMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}count'])!,
      typeUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_uuid'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id'])!,
    );
  }

  @override
  $IngredientTableTable createAlias(String alias) {
    return $IngredientTableTable(attachedDatabase, alias);
  }
}

class IngredientTableData extends DataClass
    implements Insertable<IngredientTableData> {
  final int id;
  final DateTime createdAt;
  final String name;
  final double count;
  final String typeUuid;
  final int recipeId;
  const IngredientTableData(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.count,
      required this.typeUuid,
      required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['count'] = Variable<double>(count);
    map['type_uuid'] = Variable<String>(typeUuid);
    map['recipe_id'] = Variable<int>(recipeId);
    return map;
  }

  IngredientTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      count: Value(count),
      typeUuid: Value(typeUuid),
      recipeId: Value(recipeId),
    );
  }

  factory IngredientTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientTableData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      count: serializer.fromJson<double>(json['count']),
      typeUuid: serializer.fromJson<String>(json['typeUuid']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'count': serializer.toJson<double>(count),
      'typeUuid': serializer.toJson<String>(typeUuid),
      'recipeId': serializer.toJson<int>(recipeId),
    };
  }

  IngredientTableData copyWith(
          {int? id,
          DateTime? createdAt,
          String? name,
          double? count,
          String? typeUuid,
          int? recipeId}) =>
      IngredientTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        count: count ?? this.count,
        typeUuid: typeUuid ?? this.typeUuid,
        recipeId: recipeId ?? this.recipeId,
      );
  IngredientTableData copyWithCompanion(IngredientTableCompanion data) {
    return IngredientTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      count: data.count.present ? data.count.value : this.count,
      typeUuid: data.typeUuid.present ? data.typeUuid.value : this.typeUuid,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('count: $count, ')
          ..write('typeUuid: $typeUuid, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, name, count, typeUuid, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.count == this.count &&
          other.typeUuid == this.typeUuid &&
          other.recipeId == this.recipeId);
}

class IngredientTableCompanion extends UpdateCompanion<IngredientTableData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<double> count;
  final Value<String> typeUuid;
  final Value<int> recipeId;
  const IngredientTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.count = const Value.absent(),
    this.typeUuid = const Value.absent(),
    this.recipeId = const Value.absent(),
  });
  IngredientTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    required double count,
    required String typeUuid,
    required int recipeId,
  })  : name = Value(name),
        count = Value(count),
        typeUuid = Value(typeUuid),
        recipeId = Value(recipeId);
  static Insertable<IngredientTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<double>? count,
    Expression<String>? typeUuid,
    Expression<int>? recipeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (count != null) 'count': count,
      if (typeUuid != null) 'type_uuid': typeUuid,
      if (recipeId != null) 'recipe_id': recipeId,
    });
  }

  IngredientTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<String>? name,
      Value<double>? count,
      Value<String>? typeUuid,
      Value<int>? recipeId}) {
    return IngredientTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      count: count ?? this.count,
      typeUuid: typeUuid ?? this.typeUuid,
      recipeId: recipeId ?? this.recipeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (count.present) {
      map['count'] = Variable<double>(count.value);
    }
    if (typeUuid.present) {
      map['type_uuid'] = Variable<String>(typeUuid.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('count: $count, ')
          ..write('typeUuid: $typeUuid, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftAppDatabase extends GeneratedDatabase {
  _$DriftAppDatabase(QueryExecutor e) : super(e);
  $DriftAppDatabaseManager get managers => $DriftAppDatabaseManager(this);
  late final $RecipeTableTable recipeTable = $RecipeTableTable(this);
  late final $CookingStepTableTable cookingStepTable =
      $CookingStepTableTable(this);
  late final $CountTypeTableTable countTypeTable = $CountTypeTableTable(this);
  late final $IngredientTableTable ingredientTable =
      $IngredientTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [recipeTable, cookingStepTable, countTypeTable, ingredientTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('recipe_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('cooking_step_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('count_type_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('ingredient_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('recipe_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('ingredient_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$RecipeTableTableCreateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<DateTime> createdAt,
  required String title,
  required String description,
  required int cookingTime,
  required int kilocalories,
  required int servings,
  required String difficulty,
});
typedef $$RecipeTableTableUpdateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<DateTime> createdAt,
  Value<String> title,
  Value<String> description,
  Value<int> cookingTime,
  Value<int> kilocalories,
  Value<int> servings,
  Value<String> difficulty,
});

final class $$RecipeTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $RecipeTableTable, RecipeTableData> {
  $$RecipeTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CookingStepTableTable, List<CookingStepTableData>>
      _cookingStepTableRefsTable(_$DriftAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.cookingStepTable,
              aliasName: $_aliasNameGenerator(
                  db.recipeTable.id, db.cookingStepTable.recipeId));

  $$CookingStepTableTableProcessedTableManager get cookingStepTableRefs {
    final manager =
        $$CookingStepTableTableTableManager($_db, $_db.cookingStepTable)
            .filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_cookingStepTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$IngredientTableTable, List<IngredientTableData>>
      _ingredientTableRefsTable(_$DriftAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.ingredientTable,
              aliasName: $_aliasNameGenerator(
                  db.recipeTable.id, db.ingredientTable.recipeId));

  $$IngredientTableTableProcessedTableManager get ingredientTableRefs {
    final manager =
        $$IngredientTableTableTableManager($_db, $_db.ingredientTable)
            .filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_ingredientTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecipeTableTableFilterComposer
    extends Composer<_$DriftAppDatabase, $RecipeTableTable> {
  $$RecipeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cookingTime => $composableBuilder(
      column: $table.cookingTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kilocalories => $composableBuilder(
      column: $table.kilocalories, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  Expression<bool> cookingStepTableRefs(
      Expression<bool> Function($$CookingStepTableTableFilterComposer f) f) {
    final $$CookingStepTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cookingStepTable,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CookingStepTableTableFilterComposer(
              $db: $db,
              $table: $db.cookingStepTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> ingredientTableRefs(
      Expression<bool> Function($$IngredientTableTableFilterComposer f) f) {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableFilterComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecipeTableTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $RecipeTableTable> {
  $$RecipeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cookingTime => $composableBuilder(
      column: $table.cookingTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kilocalories => $composableBuilder(
      column: $table.kilocalories,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get servings => $composableBuilder(
      column: $table.servings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));
}

class $$RecipeTableTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $RecipeTableTable> {
  $$RecipeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get cookingTime => $composableBuilder(
      column: $table.cookingTime, builder: (column) => column);

  GeneratedColumn<int> get kilocalories => $composableBuilder(
      column: $table.kilocalories, builder: (column) => column);

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  Expression<T> cookingStepTableRefs<T extends Object>(
      Expression<T> Function($$CookingStepTableTableAnnotationComposer a) f) {
    final $$CookingStepTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cookingStepTable,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CookingStepTableTableAnnotationComposer(
              $db: $db,
              $table: $db.cookingStepTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> ingredientTableRefs<T extends Object>(
      Expression<T> Function($$IngredientTableTableAnnotationComposer a) f) {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableAnnotationComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecipeTableTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $RecipeTableTable,
    RecipeTableData,
    $$RecipeTableTableFilterComposer,
    $$RecipeTableTableOrderingComposer,
    $$RecipeTableTableAnnotationComposer,
    $$RecipeTableTableCreateCompanionBuilder,
    $$RecipeTableTableUpdateCompanionBuilder,
    (RecipeTableData, $$RecipeTableTableReferences),
    RecipeTableData,
    PrefetchHooks Function(
        {bool cookingStepTableRefs, bool ingredientTableRefs})> {
  $$RecipeTableTableTableManager(_$DriftAppDatabase db, $RecipeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> cookingTime = const Value.absent(),
            Value<int> kilocalories = const Value.absent(),
            Value<int> servings = const Value.absent(),
            Value<String> difficulty = const Value.absent(),
          }) =>
              RecipeTableCompanion(
            id: id,
            uuid: uuid,
            createdAt: createdAt,
            title: title,
            description: description,
            cookingTime: cookingTime,
            kilocalories: kilocalories,
            servings: servings,
            difficulty: difficulty,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String title,
            required String description,
            required int cookingTime,
            required int kilocalories,
            required int servings,
            required String difficulty,
          }) =>
              RecipeTableCompanion.insert(
            id: id,
            uuid: uuid,
            createdAt: createdAt,
            title: title,
            description: description,
            cookingTime: cookingTime,
            kilocalories: kilocalories,
            servings: servings,
            difficulty: difficulty,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecipeTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {cookingStepTableRefs = false, ingredientTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cookingStepTableRefs) db.cookingStepTable,
                if (ingredientTableRefs) db.ingredientTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cookingStepTableRefs)
                    await $_getPrefetchedData<RecipeTableData,
                            $RecipeTableTable, CookingStepTableData>(
                        currentTable: table,
                        referencedTable: $$RecipeTableTableReferences
                            ._cookingStepTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecipeTableTableReferences(db, table, p0)
                                .cookingStepTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.recipeId == item.id),
                        typedResults: items),
                  if (ingredientTableRefs)
                    await $_getPrefetchedData<RecipeTableData,
                            $RecipeTableTable, IngredientTableData>(
                        currentTable: table,
                        referencedTable: $$RecipeTableTableReferences
                            ._ingredientTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecipeTableTableReferences(db, table, p0)
                                .ingredientTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.recipeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecipeTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftAppDatabase,
    $RecipeTableTable,
    RecipeTableData,
    $$RecipeTableTableFilterComposer,
    $$RecipeTableTableOrderingComposer,
    $$RecipeTableTableAnnotationComposer,
    $$RecipeTableTableCreateCompanionBuilder,
    $$RecipeTableTableUpdateCompanionBuilder,
    (RecipeTableData, $$RecipeTableTableReferences),
    RecipeTableData,
    PrefetchHooks Function(
        {bool cookingStepTableRefs, bool ingredientTableRefs})>;
typedef $$CookingStepTableTableCreateCompanionBuilder
    = CookingStepTableCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  required String description,
  required int recipeId,
});
typedef $$CookingStepTableTableUpdateCompanionBuilder
    = CookingStepTableCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<String> description,
  Value<int> recipeId,
});

final class $$CookingStepTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $CookingStepTableTable, CookingStepTableData> {
  $$CookingStepTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RecipeTableTable _recipeIdTable(_$DriftAppDatabase db) =>
      db.recipeTable.createAlias($_aliasNameGenerator(
          db.cookingStepTable.recipeId, db.recipeTable.id));

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipeTableTableTableManager($_db, $_db.recipeTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CookingStepTableTableFilterComposer
    extends Composer<_$DriftAppDatabase, $CookingStepTableTable> {
  $$CookingStepTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$RecipeTableTableFilterComposer get recipeId {
    final $$RecipeTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableFilterComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CookingStepTableTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $CookingStepTableTable> {
  $$CookingStepTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$RecipeTableTableOrderingComposer get recipeId {
    final $$RecipeTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableOrderingComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CookingStepTableTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $CookingStepTableTable> {
  $$CookingStepTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$RecipeTableTableAnnotationComposer get recipeId {
    final $$RecipeTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CookingStepTableTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $CookingStepTableTable,
    CookingStepTableData,
    $$CookingStepTableTableFilterComposer,
    $$CookingStepTableTableOrderingComposer,
    $$CookingStepTableTableAnnotationComposer,
    $$CookingStepTableTableCreateCompanionBuilder,
    $$CookingStepTableTableUpdateCompanionBuilder,
    (CookingStepTableData, $$CookingStepTableTableReferences),
    CookingStepTableData,
    PrefetchHooks Function({bool recipeId})> {
  $$CookingStepTableTableTableManager(
      _$DriftAppDatabase db, $CookingStepTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CookingStepTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CookingStepTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CookingStepTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> recipeId = const Value.absent(),
          }) =>
              CookingStepTableCompanion(
            id: id,
            createdAt: createdAt,
            description: description,
            recipeId: recipeId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String description,
            required int recipeId,
          }) =>
              CookingStepTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            description: description,
            recipeId: recipeId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CookingStepTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (recipeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recipeId,
                    referencedTable:
                        $$CookingStepTableTableReferences._recipeIdTable(db),
                    referencedColumn:
                        $$CookingStepTableTableReferences._recipeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CookingStepTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftAppDatabase,
    $CookingStepTableTable,
    CookingStepTableData,
    $$CookingStepTableTableFilterComposer,
    $$CookingStepTableTableOrderingComposer,
    $$CookingStepTableTableAnnotationComposer,
    $$CookingStepTableTableCreateCompanionBuilder,
    $$CookingStepTableTableUpdateCompanionBuilder,
    (CookingStepTableData, $$CookingStepTableTableReferences),
    CookingStepTableData,
    PrefetchHooks Function({bool recipeId})>;
typedef $$CountTypeTableTableCreateCompanionBuilder = CountTypeTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<DateTime> createdAt,
  required String name,
});
typedef $$CountTypeTableTableUpdateCompanionBuilder = CountTypeTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<DateTime> createdAt,
  Value<String> name,
});

final class $$CountTypeTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $CountTypeTableTable, CountTypeTableData> {
  $$CountTypeTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IngredientTableTable, List<IngredientTableData>>
      _ingredientTableRefsTable(_$DriftAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.ingredientTable,
              aliasName: $_aliasNameGenerator(
                  db.countTypeTable.uuid, db.ingredientTable.typeUuid));

  $$IngredientTableTableProcessedTableManager get ingredientTableRefs {
    final manager =
        $$IngredientTableTableTableManager($_db, $_db.ingredientTable).filter(
            (f) => f.typeUuid.uuid.sqlEquals($_itemColumn<String>('uuid')!));

    final cache =
        $_typedResult.readTableOrNull(_ingredientTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CountTypeTableTableFilterComposer
    extends Composer<_$DriftAppDatabase, $CountTypeTableTable> {
  $$CountTypeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> ingredientTableRefs(
      Expression<bool> Function($$IngredientTableTableFilterComposer f) f) {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.typeUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableFilterComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CountTypeTableTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $CountTypeTableTable> {
  $$CountTypeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$CountTypeTableTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $CountTypeTableTable> {
  $$CountTypeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> ingredientTableRefs<T extends Object>(
      Expression<T> Function($$IngredientTableTableAnnotationComposer a) f) {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.typeUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableAnnotationComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CountTypeTableTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $CountTypeTableTable,
    CountTypeTableData,
    $$CountTypeTableTableFilterComposer,
    $$CountTypeTableTableOrderingComposer,
    $$CountTypeTableTableAnnotationComposer,
    $$CountTypeTableTableCreateCompanionBuilder,
    $$CountTypeTableTableUpdateCompanionBuilder,
    (CountTypeTableData, $$CountTypeTableTableReferences),
    CountTypeTableData,
    PrefetchHooks Function({bool ingredientTableRefs})> {
  $$CountTypeTableTableTableManager(
      _$DriftAppDatabase db, $CountTypeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountTypeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountTypeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountTypeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              CountTypeTableCompanion(
            id: id,
            uuid: uuid,
            createdAt: createdAt,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String name,
          }) =>
              CountTypeTableCompanion.insert(
            id: id,
            uuid: uuid,
            createdAt: createdAt,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CountTypeTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({ingredientTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (ingredientTableRefs) db.ingredientTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ingredientTableRefs)
                    await $_getPrefetchedData<CountTypeTableData,
                            $CountTypeTableTable, IngredientTableData>(
                        currentTable: table,
                        referencedTable: $$CountTypeTableTableReferences
                            ._ingredientTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CountTypeTableTableReferences(db, table, p0)
                                .ingredientTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.typeUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CountTypeTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftAppDatabase,
    $CountTypeTableTable,
    CountTypeTableData,
    $$CountTypeTableTableFilterComposer,
    $$CountTypeTableTableOrderingComposer,
    $$CountTypeTableTableAnnotationComposer,
    $$CountTypeTableTableCreateCompanionBuilder,
    $$CountTypeTableTableUpdateCompanionBuilder,
    (CountTypeTableData, $$CountTypeTableTableReferences),
    CountTypeTableData,
    PrefetchHooks Function({bool ingredientTableRefs})>;
typedef $$IngredientTableTableCreateCompanionBuilder = IngredientTableCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  required String name,
  required double count,
  required String typeUuid,
  required int recipeId,
});
typedef $$IngredientTableTableUpdateCompanionBuilder = IngredientTableCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<String> name,
  Value<double> count,
  Value<String> typeUuid,
  Value<int> recipeId,
});

final class $$IngredientTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $IngredientTableTable, IngredientTableData> {
  $$IngredientTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CountTypeTableTable _typeUuidTable(_$DriftAppDatabase db) =>
      db.countTypeTable.createAlias($_aliasNameGenerator(
          db.ingredientTable.typeUuid, db.countTypeTable.uuid));

  $$CountTypeTableTableProcessedTableManager get typeUuid {
    final $_column = $_itemColumn<String>('type_uuid')!;

    final manager = $$CountTypeTableTableTableManager($_db, $_db.countTypeTable)
        .filter((f) => f.uuid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RecipeTableTable _recipeIdTable(_$DriftAppDatabase db) =>
      db.recipeTable.createAlias(
          $_aliasNameGenerator(db.ingredientTable.recipeId, db.recipeTable.id));

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipeTableTableTableManager($_db, $_db.recipeTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$IngredientTableTableFilterComposer
    extends Composer<_$DriftAppDatabase, $IngredientTableTable> {
  $$IngredientTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));

  $$CountTypeTableTableFilterComposer get typeUuid {
    final $$CountTypeTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeUuid,
        referencedTable: $db.countTypeTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CountTypeTableTableFilterComposer(
              $db: $db,
              $table: $db.countTypeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecipeTableTableFilterComposer get recipeId {
    final $$RecipeTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableFilterComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IngredientTableTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $IngredientTableTable> {
  $$IngredientTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));

  $$CountTypeTableTableOrderingComposer get typeUuid {
    final $$CountTypeTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeUuid,
        referencedTable: $db.countTypeTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CountTypeTableTableOrderingComposer(
              $db: $db,
              $table: $db.countTypeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecipeTableTableOrderingComposer get recipeId {
    final $$RecipeTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableOrderingComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IngredientTableTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $IngredientTableTable> {
  $$IngredientTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$CountTypeTableTableAnnotationComposer get typeUuid {
    final $$CountTypeTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeUuid,
        referencedTable: $db.countTypeTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CountTypeTableTableAnnotationComposer(
              $db: $db,
              $table: $db.countTypeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecipeTableTableAnnotationComposer get recipeId {
    final $$RecipeTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IngredientTableTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $IngredientTableTable,
    IngredientTableData,
    $$IngredientTableTableFilterComposer,
    $$IngredientTableTableOrderingComposer,
    $$IngredientTableTableAnnotationComposer,
    $$IngredientTableTableCreateCompanionBuilder,
    $$IngredientTableTableUpdateCompanionBuilder,
    (IngredientTableData, $$IngredientTableTableReferences),
    IngredientTableData,
    PrefetchHooks Function({bool typeUuid, bool recipeId})> {
  $$IngredientTableTableTableManager(
      _$DriftAppDatabase db, $IngredientTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> count = const Value.absent(),
            Value<String> typeUuid = const Value.absent(),
            Value<int> recipeId = const Value.absent(),
          }) =>
              IngredientTableCompanion(
            id: id,
            createdAt: createdAt,
            name: name,
            count: count,
            typeUuid: typeUuid,
            recipeId: recipeId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String name,
            required double count,
            required String typeUuid,
            required int recipeId,
          }) =>
              IngredientTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            name: name,
            count: count,
            typeUuid: typeUuid,
            recipeId: recipeId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IngredientTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({typeUuid = false, recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (typeUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeUuid,
                    referencedTable:
                        $$IngredientTableTableReferences._typeUuidTable(db),
                    referencedColumn: $$IngredientTableTableReferences
                        ._typeUuidTable(db)
                        .uuid,
                  ) as T;
                }
                if (recipeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recipeId,
                    referencedTable:
                        $$IngredientTableTableReferences._recipeIdTable(db),
                    referencedColumn:
                        $$IngredientTableTableReferences._recipeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$IngredientTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftAppDatabase,
    $IngredientTableTable,
    IngredientTableData,
    $$IngredientTableTableFilterComposer,
    $$IngredientTableTableOrderingComposer,
    $$IngredientTableTableAnnotationComposer,
    $$IngredientTableTableCreateCompanionBuilder,
    $$IngredientTableTableUpdateCompanionBuilder,
    (IngredientTableData, $$IngredientTableTableReferences),
    IngredientTableData,
    PrefetchHooks Function({bool typeUuid, bool recipeId})>;

class $DriftAppDatabaseManager {
  final _$DriftAppDatabase _db;
  $DriftAppDatabaseManager(this._db);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$CookingStepTableTableTableManager get cookingStepTable =>
      $$CookingStepTableTableTableManager(_db, _db.cookingStepTable);
  $$CountTypeTableTableTableManager get countTypeTable =>
      $$CountTypeTableTableTableManager(_db, _db.countTypeTable);
  $$IngredientTableTableTableManager get ingredientTable =>
      $$IngredientTableTableTableManager(_db, _db.ingredientTable);
}
