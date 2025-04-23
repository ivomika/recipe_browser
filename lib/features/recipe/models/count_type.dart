enum CountType{

  milliliter('мл.'),
  liter('л.'),
  gram('гр.'),
  piece('шт');

  final String name;
  const CountType(this.name);

  static CountType parse(String value){
    return CountType.values.firstWhere((e) => e.toString() == value);
  }
}