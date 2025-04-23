// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_app_database.dart';

// ignore_for_file: type=lint
class $RecipeModelTable extends RecipeModel
    with TableInfo<$RecipeModelTable, RecipeModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeModelTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<List<IngredientModel>, String>
      ingredients = GeneratedColumn<String>('ingredients', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<IngredientModel>>(
              $RecipeModelTable.$converteringredients);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        createdAt,
        title,
        description,
        cookingTime,
        kilocalories,
        ingredients
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_model';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeModelData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeModelData(
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
      ingredients: $RecipeModelTable.$converteringredients.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}ingredients'])!),
    );
  }

  @override
  $RecipeModelTable createAlias(String alias) {
    return $RecipeModelTable(attachedDatabase, alias);
  }

  static TypeConverter<List<IngredientModel>, String> $converteringredients =
      const IngredientConverter();
}

class RecipeModelData extends DataClass implements Insertable<RecipeModelData> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final String title;
  final String description;
  final int cookingTime;
  final int kilocalories;
  final List<IngredientModel> ingredients;
  const RecipeModelData(
      {required this.id,
      required this.uuid,
      required this.createdAt,
      required this.title,
      required this.description,
      required this.cookingTime,
      required this.kilocalories,
      required this.ingredients});
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
    {
      map['ingredients'] = Variable<String>(
          $RecipeModelTable.$converteringredients.toSql(ingredients));
    }
    return map;
  }

  RecipeModelCompanion toCompanion(bool nullToAbsent) {
    return RecipeModelCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      title: Value(title),
      description: Value(description),
      cookingTime: Value(cookingTime),
      kilocalories: Value(kilocalories),
      ingredients: Value(ingredients),
    );
  }

  factory RecipeModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeModelData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      cookingTime: serializer.fromJson<int>(json['cookingTime']),
      kilocalories: serializer.fromJson<int>(json['kilocalories']),
      ingredients:
          serializer.fromJson<List<IngredientModel>>(json['ingredients']),
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
      'ingredients': serializer.toJson<List<IngredientModel>>(ingredients),
    };
  }

  RecipeModelData copyWith(
          {int? id,
          String? uuid,
          DateTime? createdAt,
          String? title,
          String? description,
          int? cookingTime,
          int? kilocalories,
          List<IngredientModel>? ingredients}) =>
      RecipeModelData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        description: description ?? this.description,
        cookingTime: cookingTime ?? this.cookingTime,
        kilocalories: kilocalories ?? this.kilocalories,
        ingredients: ingredients ?? this.ingredients,
      );
  RecipeModelData copyWithCompanion(RecipeModelCompanion data) {
    return RecipeModelData(
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
      ingredients:
          data.ingredients.present ? data.ingredients.value : this.ingredients,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeModelData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('kilocalories: $kilocalories, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, createdAt, title, description,
      cookingTime, kilocalories, ingredients);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeModelData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.description == this.description &&
          other.cookingTime == this.cookingTime &&
          other.kilocalories == this.kilocalories &&
          other.ingredients == this.ingredients);
}

class RecipeModelCompanion extends UpdateCompanion<RecipeModelData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<String> title;
  final Value<String> description;
  final Value<int> cookingTime;
  final Value<int> kilocalories;
  final Value<List<IngredientModel>> ingredients;
  const RecipeModelCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.kilocalories = const Value.absent(),
    this.ingredients = const Value.absent(),
  });
  RecipeModelCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String title,
    required String description,
    required int cookingTime,
    required int kilocalories,
    required List<IngredientModel> ingredients,
  })  : title = Value(title),
        description = Value(description),
        cookingTime = Value(cookingTime),
        kilocalories = Value(kilocalories),
        ingredients = Value(ingredients);
  static Insertable<RecipeModelData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? cookingTime,
    Expression<int>? kilocalories,
    Expression<String>? ingredients,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (cookingTime != null) 'cooking_time': cookingTime,
      if (kilocalories != null) 'kilocalories': kilocalories,
      if (ingredients != null) 'ingredients': ingredients,
    });
  }

  RecipeModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<DateTime>? createdAt,
      Value<String>? title,
      Value<String>? description,
      Value<int>? cookingTime,
      Value<int>? kilocalories,
      Value<List<IngredientModel>>? ingredients}) {
    return RecipeModelCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      cookingTime: cookingTime ?? this.cookingTime,
      kilocalories: kilocalories ?? this.kilocalories,
      ingredients: ingredients ?? this.ingredients,
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
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(
          $RecipeModelTable.$converteringredients.toSql(ingredients.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeModelCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('kilocalories: $kilocalories, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftAppDatabase extends GeneratedDatabase {
  _$DriftAppDatabase(QueryExecutor e) : super(e);
  $DriftAppDatabaseManager get managers => $DriftAppDatabaseManager(this);
  late final $RecipeModelTable recipeModel = $RecipeModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recipeModel];
}

typedef $$RecipeModelTableCreateCompanionBuilder = RecipeModelCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<DateTime> createdAt,
  required String title,
  required String description,
  required int cookingTime,
  required int kilocalories,
  required List<IngredientModel> ingredients,
});
typedef $$RecipeModelTableUpdateCompanionBuilder = RecipeModelCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<DateTime> createdAt,
  Value<String> title,
  Value<String> description,
  Value<int> cookingTime,
  Value<int> kilocalories,
  Value<List<IngredientModel>> ingredients,
});

class $$RecipeModelTableFilterComposer
    extends Composer<_$DriftAppDatabase, $RecipeModelTable> {
  $$RecipeModelTableFilterComposer({
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

  ColumnWithTypeConverterFilters<List<IngredientModel>, List<IngredientModel>,
          String>
      get ingredients => $composableBuilder(
          column: $table.ingredients,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$RecipeModelTableOrderingComposer
    extends Composer<_$DriftAppDatabase, $RecipeModelTable> {
  $$RecipeModelTableOrderingComposer({
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

  ColumnOrderings<String> get ingredients => $composableBuilder(
      column: $table.ingredients, builder: (column) => ColumnOrderings(column));
}

class $$RecipeModelTableAnnotationComposer
    extends Composer<_$DriftAppDatabase, $RecipeModelTable> {
  $$RecipeModelTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<List<IngredientModel>, String>
      get ingredients => $composableBuilder(
          column: $table.ingredients, builder: (column) => column);
}

class $$RecipeModelTableTableManager extends RootTableManager<
    _$DriftAppDatabase,
    $RecipeModelTable,
    RecipeModelData,
    $$RecipeModelTableFilterComposer,
    $$RecipeModelTableOrderingComposer,
    $$RecipeModelTableAnnotationComposer,
    $$RecipeModelTableCreateCompanionBuilder,
    $$RecipeModelTableUpdateCompanionBuilder,
    (
      RecipeModelData,
      BaseReferences<_$DriftAppDatabase, $RecipeModelTable, RecipeModelData>
    ),
    RecipeModelData,
    PrefetchHooks Function()> {
  $$RecipeModelTableTableManager(_$DriftAppDatabase db, $RecipeModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> cookingTime = const Value.absent(),
            Value<int> kilocalories = const Value.absent(),
            Value<List<IngredientModel>> ingredients = const Value.absent(),
          }) =>
              RecipeModelCompanion(
            id: id,
            uuid: uuid,
            createdAt: createdAt,
            title: title,
            description: description,
            cookingTime: cookingTime,
            kilocalories: kilocalories,
            ingredients: ingredients,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String title,
            required String description,
            required int cookingTime,
            required int kilocalories,
            required List<IngredientModel> ingredients,
          }) =>
              RecipeModelCompanion.insert(
            id: id,
            uuid: uuid,
            createdAt: createdAt,
            title: title,
            description: description,
            cookingTime: cookingTime,
            kilocalories: kilocalories,
            ingredients: ingredients,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecipeModelTableProcessedTableManager = ProcessedTableManager<
    _$DriftAppDatabase,
    $RecipeModelTable,
    RecipeModelData,
    $$RecipeModelTableFilterComposer,
    $$RecipeModelTableOrderingComposer,
    $$RecipeModelTableAnnotationComposer,
    $$RecipeModelTableCreateCompanionBuilder,
    $$RecipeModelTableUpdateCompanionBuilder,
    (
      RecipeModelData,
      BaseReferences<_$DriftAppDatabase, $RecipeModelTable, RecipeModelData>
    ),
    RecipeModelData,
    PrefetchHooks Function()>;

class $DriftAppDatabaseManager {
  final _$DriftAppDatabase _db;
  $DriftAppDatabaseManager(this._db);
  $$RecipeModelTableTableManager get recipeModel =>
      $$RecipeModelTableTableManager(_db, _db.recipeModel);
}
