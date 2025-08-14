class ListModel<T extends Object>{
  late int _lastIndex;
  late final Map<int, T> _models;

  Iterable<int> get indexes => _models.keys;
  Iterable<T> get models => _models.values;
  int get length => _models.length;


  ListModel({
    required int initIndex,
    required List<T> initValue
  }){
    _lastIndex = initIndex;
    _models = {for (final e in initValue) _lastIndex++ : e};
  }

  void insert(T value) {
    _models[_lastIndex++] = value;
  }

  void removeAt(int index){
    final element = _models.entries.elementAt(index);
    _models.remove(element.key);
  }
}