class ValueRow {
  double? _value;
  double? _estimatedValue;

  double? get value => _value;
  set value(double? val) {
    _value = val;
  }

  double? get estimatedValue => _estimatedValue;
  set estimatedValue(double? val) {
    _estimatedValue = val;
  }
}