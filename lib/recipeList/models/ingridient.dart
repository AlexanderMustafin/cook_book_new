class Ingrident {
  final String unit;
  final String ingredient;
  final dynamic quantity;

  Ingrident({required this.unit, required this.ingredient, this.quantity});

  factory Ingrident.fromJson(Map<String, dynamic> json) {
    return Ingrident(
      unit: json['unit'] == null ? '' : json['unit'] as String,
      ingredient: json['ingredient'] == null ? '': json['ingredient'] as String,
      quantity: json['quantity'] == null ? '' : json['quantity'] as double,
      );
  }
}
