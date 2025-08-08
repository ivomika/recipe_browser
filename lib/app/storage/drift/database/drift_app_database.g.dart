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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  final String id;
  final DateTime createdAt;
  final String title;
  final String description;
  final int cookingTime;
  final int kilocalories;
  final int servings;
  final String difficulty;
  const RecipeTableData(
      {required this.id,
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
    map['id'] = Variable<String>(id);
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
      id: serializer.fromJson<String>(json['id']),
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
      'id': serializer.toJson<String>(id),
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
          {String? id,
          DateTime? createdAt,
          String? title,
          String? description,
          int? cookingTime,
          int? kilocalories,
          int? servings,
          String? difficulty}) =>
      RecipeTableData(
        id: id ?? this.id,
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
  int get hashCode => Object.hash(id, createdAt, title, description,
      cookingTime, kilocalories, servings, difficulty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.description == this.description &&
          other.cookingTime == this.cookingTime &&
          other.kilocalories == this.kilocalories &&
          other.servings == this.servings &&
          other.difficulty == this.difficulty);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> title;
  final Value<String> description;
  final Value<int> cookingTime;
  final Value<int> kilocalories;
  final Value<int> servings;
  final Value<String> difficulty;
  final Value<int> rowid;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.kilocalories = const Value.absent(),
    this.servings = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String title,
    required String description,
    required int cookingTime,
    required int kilocalories,
    required int servings,
    required String difficulty,
    this.rowid = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        cookingTime = Value(cookingTime),
        kilocalories = Value(kilocalories),
        servings = Value(servings),
        difficulty = Value(difficulty);
  static Insertable<RecipeTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? cookingTime,
    Expression<int>? kilocalories,
    Expression<int>? servings,
    Expression<String>? difficulty,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (cookingTime != null) 'cooking_time': cookingTime,
      if (kilocalories != null) 'kilocalories': kilocalories,
      if (servings != null) 'servings': servings,
      if (difficulty != null) 'difficulty': difficulty,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? title,
      Value<String>? description,
      Value<int>? cookingTime,
      Value<int>? kilocalories,
      Value<int>? servings,
      Value<String>? difficulty,
      Value<int>? rowid}) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      cookingTime: cookingTime ?? this.cookingTime,
      kilocalories: kilocalories ?? this.kilocalories,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('kilocalories: $kilocalories, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string,
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
    );
  }

  @override
  $CookingStepTableTable createAlias(String alias) {
    return $CookingStepTableTable(attachedDatabase, alias);
  }
}

class CookingStepTableData extends DataClass
    implements Insertable<CookingStepTableData> {
  final String id;
  final DateTime createdAt;
  final String description;
  final String recipeId;
  const CookingStepTableData(
      {required this.id,
      required this.createdAt,
      required this.description,
      required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['description'] = Variable<String>(description);
    map['recipe_id'] = Variable<String>(recipeId);
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
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      description: serializer.fromJson<String>(json['description']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'description': serializer.toJson<String>(description),
      'recipeId': serializer.toJson<String>(recipeId),
    };
  }

  CookingStepTableData copyWith(
          {String? id,
          DateTime? createdAt,
          String? description,
          String? recipeId}) =>
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
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> description;
  final Value<String> recipeId;
  final Value<int> rowid;
  const CookingStepTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.description = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CookingStepTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String description,
    required String recipeId,
    this.rowid = const Value.absent(),
  })  : description = Value(description),
        recipeId = Value(recipeId);
  static Insertable<CookingStepTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? description,
    Expression<String>? recipeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (description != null) 'description': description,
      if (recipeId != null) 'recipe_id': recipeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CookingStepTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? description,
      Value<String>? recipeId,
      Value<int>? rowid}) {
    return CookingStepTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      recipeId: recipeId ?? this.recipeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookingStepTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('description: $description, ')
          ..write('recipeId: $recipeId, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [id, createdAt, name];
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  final String id;
  final DateTime createdAt;
  final String name;
  const CountTypeTableData(
      {required this.id, required this.createdAt, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    return map;
  }

  CountTypeTableCompanion toCompanion(bool nullToAbsent) {
    return CountTypeTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
    );
  }

  factory CountTypeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountTypeTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
    };
  }

  CountTypeTableData copyWith(
          {String? id, DateTime? createdAt, String? name}) =>
      CountTypeTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
      );
  CountTypeTableData copyWithCompanion(CountTypeTableCompanion data) {
    return CountTypeTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountTypeTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountTypeTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name);
}

class CountTypeTableCompanion extends UpdateCompanion<CountTypeTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<int> rowid;
  const CountTypeTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountTypeTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CountTypeTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountTypeTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? name,
      Value<int>? rowid}) {
    return CountTypeTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountTypeTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
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
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<double> count = GeneratedColumn<double>(
      'count', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<String> typeId = GeneratedColumn<String>(
      'type_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES count_type_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recipe_table (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, name, count, typeId, recipeId];
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
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}count'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_id'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
    );
  }

  @override
  $IngredientTableTable createAlias(String alias) {
    return $IngredientTableTable(attachedDatabase, alias);
  }
}

class IngredientTableData extends DataClass
    implements Insertable<IngredientTableData> {
  final String id;
  final DateTime createdAt;
  final String name;
  final double count;
  final String typeId;
  final String recipeId;
  const IngredientTableData(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.count,
      required this.typeId,
      required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['count'] = Variable<double>(count);
    map['type_id'] = Variable<String>(typeId);
    map['recipe_id'] = Variable<String>(recipeId);
    return map;
  }

  IngredientTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      count: Value(count),
      typeId: Value(typeId),
      recipeId: Value(recipeId),
    );
  }

  factory IngredientTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      count: serializer.fromJson<double>(json['count']),
      typeId: serializer.fromJson<String>(json['typeId']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'count': serializer.toJson<double>(count),
      'typeId': serializer.toJson<String>(typeId),
      'recipeId': serializer.toJson<String>(recipeId),
    };
  }

  IngredientTableData copyWith(
          {String? id,
          DateTime? createdAt,
          String? name,
          double? count,
          String? typeId,
          String? recipeId}) =>
      IngredientTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        count: count ?? this.count,
        typeId: typeId ?? this.typeId,
        recipeId: recipeId ?? this.recipeId,
      );
  IngredientTableData copyWithCompanion(IngredientTableCompanion data) {
    return IngredientTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      count: data.count.present ? data.count.value : this.count,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
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
          ..write('typeId: $typeId, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, name, count, typeId, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.count == this.count &&
          other.typeId == this.typeId &&
          other.recipeId == this.recipeId);
}

class IngredientTableCompanion extends UpdateCompanion<IngredientTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<double> count;
  final Value<String> typeId;
  final Value<String> recipeId;
  final Value<int> rowid;
  const IngredientTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.count = const Value.absent(),
    this.typeId = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    required double count,
    required String typeId,
    required String recipeId,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        count = Value(count),
        typeId = Value(typeId),
        recipeId = Value(recipeId);
  static Insertable<IngredientTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<double>? count,
    Expression<String>? typeId,
    Expression<String>? recipeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (count != null) 'count': count,
      if (typeId != null) 'type_id': typeId,
      if (recipeId != null) 'recipe_id': recipeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? name,
      Value<double>? count,
      Value<String>? typeId,
      Value<String>? recipeId,
      Value<int>? rowid}) {
    return IngredientTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      count: count ?? this.count,
      typeId: typeId ?? this.typeId,
      recipeId: recipeId ?? this.recipeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (typeId.present) {
      map['type_id'] = Variable<String>(typeId.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('typeId: $typeId, ')
          ..write('recipeId: $recipeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionTableTable extends CollectionTable
    with TableInfo<$CollectionTableTable, CollectionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CollectionTableData> instance,
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $CollectionTableTable createAlias(String alias) {
    return $CollectionTableTable(attachedDatabase, alias);
  }
}

class CollectionTableData extends DataClass
    implements Insertable<CollectionTableData> {
  final String id;
  final DateTime createdAt;
  final String title;
  const CollectionTableData(
      {required this.id, required this.createdAt, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['title'] = Variable<String>(title);
    return map;
  }

  CollectionTableCompanion toCompanion(bool nullToAbsent) {
    return CollectionTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      title: Value(title),
    );
  }

  factory CollectionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'title': serializer.toJson<String>(title),
    };
  }

  CollectionTableData copyWith(
          {String? id, DateTime? createdAt, String? title}) =>
      CollectionTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
      );
  CollectionTableData copyWithCompanion(CollectionTableCompanion data) {
    return CollectionTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.title == this.title);
}

class CollectionTableCompanion extends UpdateCompanion<CollectionTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> title;
  final Value<int> rowid;
  const CollectionTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String title,
    this.rowid = const Value.absent(),
  }) : title = Value(title);
  static Insertable<CollectionTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? title,
      Value<int>? rowid}) {
    return CollectionTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeCollectionsTableTable extends RecipeCollectionsTable
    with TableInfo<$RecipeCollectionsTableTable, RecipeCollectionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeCollectionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recipe_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES collection_table (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [recipeId, collectionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_collections_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecipeCollectionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId, collectionId};
  @override
  RecipeCollectionsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeCollectionsTableData(
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
    );
  }

  @override
  $RecipeCollectionsTableTable createAlias(String alias) {
    return $RecipeCollectionsTableTable(attachedDatabase, alias);
  }
}

class RecipeCollectionsTableData extends DataClass
    implements Insertable<RecipeCollectionsTableData> {
  final String recipeId;
  final String collectionId;
  const RecipeCollectionsTableData(
      {required this.recipeId, required this.collectionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    map['collection_id'] = Variable<String>(collectionId);
    return map;
  }

  RecipeCollectionsTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeCollectionsTableCompanion(
      recipeId: Value(recipeId),
      collectionId: Value(collectionId),
    );
  }

  factory RecipeCollectionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeCollectionsTableData(
      recipeId: serializer.fromJson<String>(json['recipeId']),
      collectionId: serializer.fromJson<String>(json['collectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<String>(recipeId),
      'collectionId': serializer.toJson<String>(collectionId),
    };
  }

  RecipeCollectionsTableData copyWith(
          {String? recipeId, String? collectionId}) =>
      RecipeCollectionsTableData(
        recipeId: recipeId ?? this.recipeId,
        collectionId: collectionId ?? this.collectionId,
      );
  RecipeCollectionsTableData copyWithCompanion(
      RecipeCollectionsTableCompanion data) {
    return RecipeCollectionsTableData(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCollectionsTableData(')
          ..write('recipeId: $recipeId, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, collectionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeCollectionsTableData &&
          other.recipeId == this.recipeId &&
          other.collectionId == this.collectionId);
}

class RecipeCollectionsTableCompanion
    extends UpdateCompanion<RecipeCollectionsTableData> {
  final Value<String> recipeId;
  final Value<String> collectionId;
  final Value<int> rowid;
  const RecipeCollectionsTableCompanion({
    this.recipeId = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeCollectionsTableCompanion.insert({
    required String recipeId,
    required String collectionId,
    this.rowid = const Value.absent(),
  })  : recipeId = Value(recipeId),
        collectionId = Value(collectionId);
  static Insertable<RecipeCollectionsTableData> custom({
    Expression<String>? recipeId,
    Expression<String>? collectionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (collectionId != null) 'collection_id': collectionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeCollectionsTableCompanion copyWith(
      {Value<String>? recipeId,
      Value<String>? collectionId,
      Value<int>? rowid}) {
    return RecipeCollectionsTableCompanion(
      recipeId: recipeId ?? this.recipeId,
      collectionId: collectionId ?? this.collectionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCollectionsTableCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('collectionId: $collectionId, ')
          ..write('rowid: $rowid')
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
  late final $CollectionTableTable collectionTable =
      $CollectionTableTable(this);
  late final $RecipeCollectionsTableTable recipeCollectionsTable =
      $RecipeCollectionsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        recipeTable,
        cookingStepTable,
        countTypeTable,
        ingredientTable,
        collectionTable,
        recipeCollectionsTable
      ];
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('recipe_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('recipe_collections_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('collection_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('recipe_collections_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$RecipeTableTableCreateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  required String title,
  required String description,
  required int cookingTime,
  required int kilocalories,
  required int servings,
  required String difficulty,
  Value<int> rowid,
});
typedef $$RecipeTableTableUpdateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> title,
  Value<String> description,
  Value<int> cookingTime,
  Value<int> kilocalories,
  Value<int> servings,
  Value<String> difficulty,
  Value<int> rowid,
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
    final manager = $$CookingStepTableTableTableManager(
            $_db, $_db.cookingStepTable)
        .filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

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
    final manager = $$IngredientTableTableTableManager(
            $_db, $_db.ingredientTable)
        .filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_ingredientTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RecipeCollectionsTableTable,
      List<RecipeCollectionsTableData>> _recipeCollectionsTableRefsTable(
          _$DriftAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.recipeCollectionsTable,
          aliasName: $_aliasNameGenerator(
              db.recipeTable.id, db.recipeCollectionsTable.recipeId));

  $$RecipeCollectionsTableTableProcessedTableManager
      get recipeCollectionsTableRefs {
    final manager = $$RecipeCollectionsTableTableTableManager(
            $_db, $_db.recipeCollectionsTable)
        .filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_recipeCollectionsTableRefsTable($_db));
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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

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

  Expression<bool> recipeCollectionsTableRefs(
      Expression<bool> Function($$RecipeCollectionsTableTableFilterComposer f)
          f) {
    final $$RecipeCollectionsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.recipeCollectionsTable,
            getReferencedColumn: (t) => t.recipeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecipeCollectionsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.recipeCollectionsTable,
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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

  Expression<T> recipeCollectionsTableRefs<T extends Object>(
      Expression<T> Function($$RecipeCollectionsTableTableAnnotationComposer a)
          f) {
    final $$RecipeCollectionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.recipeCollectionsTable,
            getReferencedColumn: (t) => t.recipeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecipeCollectionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.recipeCollectionsTable,
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
        {bool cookingStepTableRefs,
        bool ingredientTableRefs,
        bool recipeCollectionsTableRefs})> {
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
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> cookingTime = const Value.absent(),
            Value<int> kilocalories = const Value.absent(),
            Value<int> servings = const Value.absent(),
            Value<String> difficulty = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeTableCompanion(
            id: id,
            createdAt: createdAt,
            title: title,
            description: description,
            cookingTime: cookingTime,
            kilocalories: kilocalories,
            servings: servings,
            difficulty: difficulty,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String title,
            required String description,
            required int cookingTime,
            required int kilocalories,
            required int servings,
            required String difficulty,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            title: title,
            description: description,
            cookingTime: cookingTime,
            kilocalories: kilocalories,
            servings: servings,
            difficulty: difficulty,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecipeTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {cookingStepTableRefs = false,
              ingredientTableRefs = false,
              recipeCollectionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cookingStepTableRefs) db.cookingStepTable,
                if (ingredientTableRefs) db.ingredientTable,
                if (recipeCollectionsTableRefs) db.recipeCollectionsTable
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
                        typedResults: items),
                  if (recipeCollectionsTableRefs)
                    await $_getPrefetchedData<RecipeTableData,
                            $RecipeTableTable, RecipeCollectionsTableData>(
                        currentTable: table,
                        referencedTable: $$RecipeTableTableReferences
                            ._recipeCollectionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecipeTableTableReferences(db, table, p0)
                                .recipeCollectionsTableRefs,
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
        {bool cookingStepTableRefs,
        bool ingredientTableRefs,
        bool recipeCollectionsTableRefs})>;
typedef $$CookingStepTableTableCreateCompanionBuilder
    = CookingStepTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  required String description,
  required String recipeId,
  Value<int> rowid,
});
typedef $$CookingStepTableTableUpdateCompanionBuilder
    = CookingStepTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> description,
  Value<String> recipeId,
  Value<int> rowid,
});

final class $$CookingStepTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $CookingStepTableTable, CookingStepTableData> {
  $$CookingStepTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RecipeTableTable _recipeIdTable(_$DriftAppDatabase db) =>
      db.recipeTable.createAlias($_aliasNameGenerator(
          db.cookingStepTable.recipeId, db.recipeTable.id));

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

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
  ColumnFilters<String> get id => $composableBuilder(
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
  ColumnOrderings<String> get id => $composableBuilder(
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
  GeneratedColumn<String> get id =>
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
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> recipeId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CookingStepTableCompanion(
            id: id,
            createdAt: createdAt,
            description: description,
            recipeId: recipeId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String description,
            required String recipeId,
            Value<int> rowid = const Value.absent(),
          }) =>
              CookingStepTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            description: description,
            recipeId: recipeId,
            rowid: rowid,
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
  Value<String> id,
  Value<DateTime> createdAt,
  required String name,
  Value<int> rowid,
});
typedef $$CountTypeTableTableUpdateCompanionBuilder = CountTypeTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> name,
  Value<int> rowid,
});

final class $$CountTypeTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $CountTypeTableTable, CountTypeTableData> {
  $$CountTypeTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IngredientTableTable, List<IngredientTableData>>
      _ingredientTableRefsTable(_$DriftAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.ingredientTable,
              aliasName: $_aliasNameGenerator(
                  db.countTypeTable.id, db.ingredientTable.typeId));

  $$IngredientTableTableProcessedTableManager get ingredientTableRefs {
    final manager =
        $$IngredientTableTableTableManager($_db, $_db.ingredientTable)
            .filter((f) => f.typeId.id.sqlEquals($_itemColumn<String>('id')!));

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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> ingredientTableRefs(
      Expression<bool> Function($$IngredientTableTableFilterComposer f) f) {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.typeId,
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> ingredientTableRefs<T extends Object>(
      Expression<T> Function($$IngredientTableTableAnnotationComposer a) f) {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.typeId,
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
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CountTypeTableCompanion(
            id: id,
            createdAt: createdAt,
            name: name,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String name,
            Value<int> rowid = const Value.absent(),
          }) =>
              CountTypeTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            name: name,
            rowid: rowid,
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
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.typeId == item.id),
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
  Value<String> id,
  Value<DateTime> createdAt,
  required String name,
  required double count,
  required String typeId,
  required String recipeId,
  Value<int> rowid,
});
typedef $$IngredientTableTableUpdateCompanionBuilder = IngredientTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> name,
  Value<double> count,
  Value<String> typeId,
  Value<String> recipeId,
  Value<int> rowid,
});

final class $$IngredientTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $IngredientTableTable, IngredientTableData> {
  $$IngredientTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CountTypeTableTable _typeIdTable(_$DriftAppDatabase db) =>
      db.countTypeTable.createAlias($_aliasNameGenerator(
          db.ingredientTable.typeId, db.countTypeTable.id));

  $$CountTypeTableTableProcessedTableManager get typeId {
    final $_column = $_itemColumn<String>('type_id')!;

    final manager = $$CountTypeTableTableTableManager($_db, $_db.countTypeTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RecipeTableTable _recipeIdTable(_$DriftAppDatabase db) =>
      db.recipeTable.createAlias(
          $_aliasNameGenerator(db.ingredientTable.recipeId, db.recipeTable.id));

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));

  $$CountTypeTableTableFilterComposer get typeId {
    final $$CountTypeTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.countTypeTable,
        getReferencedColumn: (t) => t.id,
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));

  $$CountTypeTableTableOrderingComposer get typeId {
    final $$CountTypeTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.countTypeTable,
        getReferencedColumn: (t) => t.id,
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$CountTypeTableTableAnnotationComposer get typeId {
    final $$CountTypeTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.countTypeTable,
        getReferencedColumn: (t) => t.id,
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
    PrefetchHooks Function({bool typeId, bool recipeId})> {
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
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> count = const Value.absent(),
            Value<String> typeId = const Value.absent(),
            Value<String> recipeId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IngredientTableCompanion(
            id: id,
            createdAt: createdAt,
            name: name,
            count: count,
            typeId: typeId,
            recipeId: recipeId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String name,
            required double count,
            required String typeId,
            required String recipeId,
            Value<int> rowid = const Value.absent(),
          }) =>
              IngredientTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            name: name,
            count: count,
            typeId: typeId,
            recipeId: recipeId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IngredientTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({typeId = false, recipeId = false}) {
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
                if (typeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeId,
                    referencedTable:
                        $$IngredientTableTableReferences._typeIdTable(db),
                    referencedColumn:
                        $$IngredientTableTableReferences._typeIdTable(db).id,
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
    PrefetchHooks Function({bool typeId, bool recipeId})>;
typedef $$CollectionTableTableCreateCompanionBuilder = CollectionTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  required String title,
  Value<int> rowid,
});
typedef $$CollectionTableTableUpdateCompanionBuilder = CollectionTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> title,
  Value<int> rowid,
});

final class $$CollectionTableTableReferences extends BaseReferences<
    _$DriftAppDatabase, $CollectionTableTable, CollectionTableData> {
  $$CollectionTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeCollectionsTableTable,
      List<RecipeCollectionsTableData>> _recipeCollectionsTableRefsTable(
          _$DriftAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.recipeCollectionsTable,
          aliasName: $_aliasNameGenerator(
              db.collectionTable.id, db.recipeCollectionsTable.collectionId));

  $$RecipeCollectionsTableTableProcessedTableManager
      get recipeCollectionsTableRefs {
    final manager = $$RecipeCollectionsTableTableTableManager(
            $_db, $_db.recipeCollectionsTable)
        .filter(
            (f) => f.collectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_recipeCollectionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CollectionTableTableFilterComposer
    extends Composer<_$DriftAppDatabase, $CollectionTableTable> {
  $$CollectionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  Expression<bool> recipeCollectionsTableRefs(
      Expression<bool> Function($$RecipeCollectionsTableTableFilterComposer f)
          f) {
    final $$RecipeCollectionsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.recipeCollectionsTable,
            getReferencedColumn: (t) => t.collectionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecipeCollectionsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.recipeCollectionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CollectionTableTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $CollectionTableTable> {
  $$CollectionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$CollectionTableTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $CollectionTableTable> {
  $$CollectionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> recipeCollectionsTableRefs<T extends Object>(
      Expression<T> Function($$RecipeCollectionsTableTableAnnotationComposer a)
          f) {
    final $$RecipeCollectionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.recipeCollectionsTable,
            getReferencedColumn: (t) => t.collectionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecipeCollectionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.recipeCollectionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CollectionTableTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $CollectionTableTable,
    CollectionTableData,
    $$CollectionTableTableFilterComposer,
    $$CollectionTableTableOrderingComposer,
    $$CollectionTableTableAnnotationComposer,
    $$CollectionTableTableCreateCompanionBuilder,
    $$CollectionTableTableUpdateCompanionBuilder,
    (CollectionTableData, $$CollectionTableTableReferences),
    CollectionTableData,
    PrefetchHooks Function({bool recipeCollectionsTableRefs})> {
  $$CollectionTableTableTableManager(
      _$DriftAppDatabase db, $CollectionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionTableCompanion(
            id: id,
            createdAt: createdAt,
            title: title,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String title,
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            title: title,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recipeCollectionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeCollectionsTableRefs) db.recipeCollectionsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeCollectionsTableRefs)
                    await $_getPrefetchedData<CollectionTableData,
                            $CollectionTableTable, RecipeCollectionsTableData>(
                        currentTable: table,
                        referencedTable: $$CollectionTableTableReferences
                            ._recipeCollectionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionTableTableReferences(db, table, p0)
                                .recipeCollectionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CollectionTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftAppDatabase,
    $CollectionTableTable,
    CollectionTableData,
    $$CollectionTableTableFilterComposer,
    $$CollectionTableTableOrderingComposer,
    $$CollectionTableTableAnnotationComposer,
    $$CollectionTableTableCreateCompanionBuilder,
    $$CollectionTableTableUpdateCompanionBuilder,
    (CollectionTableData, $$CollectionTableTableReferences),
    CollectionTableData,
    PrefetchHooks Function({bool recipeCollectionsTableRefs})>;
typedef $$RecipeCollectionsTableTableCreateCompanionBuilder
    = RecipeCollectionsTableCompanion Function({
  required String recipeId,
  required String collectionId,
  Value<int> rowid,
});
typedef $$RecipeCollectionsTableTableUpdateCompanionBuilder
    = RecipeCollectionsTableCompanion Function({
  Value<String> recipeId,
  Value<String> collectionId,
  Value<int> rowid,
});

final class $$RecipeCollectionsTableTableReferences extends BaseReferences<
    _$DriftAppDatabase,
    $RecipeCollectionsTableTable,
    RecipeCollectionsTableData> {
  $$RecipeCollectionsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RecipeTableTable _recipeIdTable(_$DriftAppDatabase db) =>
      db.recipeTable.createAlias($_aliasNameGenerator(
          db.recipeCollectionsTable.recipeId, db.recipeTable.id));

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipeTableTableTableManager($_db, $_db.recipeTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CollectionTableTable _collectionIdTable(_$DriftAppDatabase db) =>
      db.collectionTable.createAlias($_aliasNameGenerator(
          db.recipeCollectionsTable.collectionId, db.collectionTable.id));

  $$CollectionTableTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<String>('collection_id')!;

    final manager =
        $$CollectionTableTableTableManager($_db, $_db.collectionTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RecipeCollectionsTableTableFilterComposer
    extends Composer<_$DriftAppDatabase, $RecipeCollectionsTableTable> {
  $$RecipeCollectionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  $$CollectionTableTableFilterComposer get collectionId {
    final $$CollectionTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableFilterComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeCollectionsTableTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $RecipeCollectionsTableTable> {
  $$RecipeCollectionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  $$CollectionTableTableOrderingComposer get collectionId {
    final $$CollectionTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableOrderingComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeCollectionsTableTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $RecipeCollectionsTableTable> {
  $$RecipeCollectionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
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

  $$CollectionTableTableAnnotationComposer get collectionId {
    final $$CollectionTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableAnnotationComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeCollectionsTableTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $RecipeCollectionsTableTable,
    RecipeCollectionsTableData,
    $$RecipeCollectionsTableTableFilterComposer,
    $$RecipeCollectionsTableTableOrderingComposer,
    $$RecipeCollectionsTableTableAnnotationComposer,
    $$RecipeCollectionsTableTableCreateCompanionBuilder,
    $$RecipeCollectionsTableTableUpdateCompanionBuilder,
    (RecipeCollectionsTableData, $$RecipeCollectionsTableTableReferences),
    RecipeCollectionsTableData,
    PrefetchHooks Function({bool recipeId, bool collectionId})> {
  $$RecipeCollectionsTableTableTableManager(
      _$DriftAppDatabase db, $RecipeCollectionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeCollectionsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeCollectionsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeCollectionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> recipeId = const Value.absent(),
            Value<String> collectionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeCollectionsTableCompanion(
            recipeId: recipeId,
            collectionId: collectionId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String recipeId,
            required String collectionId,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeCollectionsTableCompanion.insert(
            recipeId: recipeId,
            collectionId: collectionId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecipeCollectionsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recipeId = false, collectionId = false}) {
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
                    referencedTable: $$RecipeCollectionsTableTableReferences
                        ._recipeIdTable(db),
                    referencedColumn: $$RecipeCollectionsTableTableReferences
                        ._recipeIdTable(db)
                        .id,
                  ) as T;
                }
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable: $$RecipeCollectionsTableTableReferences
                        ._collectionIdTable(db),
                    referencedColumn: $$RecipeCollectionsTableTableReferences
                        ._collectionIdTable(db)
                        .id,
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

typedef $$RecipeCollectionsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftAppDatabase,
        $RecipeCollectionsTableTable,
        RecipeCollectionsTableData,
        $$RecipeCollectionsTableTableFilterComposer,
        $$RecipeCollectionsTableTableOrderingComposer,
        $$RecipeCollectionsTableTableAnnotationComposer,
        $$RecipeCollectionsTableTableCreateCompanionBuilder,
        $$RecipeCollectionsTableTableUpdateCompanionBuilder,
        (RecipeCollectionsTableData, $$RecipeCollectionsTableTableReferences),
        RecipeCollectionsTableData,
        PrefetchHooks Function({bool recipeId, bool collectionId})>;

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
  $$CollectionTableTableTableManager get collectionTable =>
      $$CollectionTableTableTableManager(_db, _db.collectionTable);
  $$RecipeCollectionsTableTableTableManager get recipeCollectionsTable =>
      $$RecipeCollectionsTableTableTableManager(
          _db, _db.recipeCollectionsTable);
}
