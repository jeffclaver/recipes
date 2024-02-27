class RecipeDto {
  RecipeDto({
    required this.id,
    required this.titulo,
    required this.textoReceita,
  });

  final int id;
  final String titulo;
  final String textoReceita;

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      id: json['id'],
      titulo: json['titulo'],
      textoReceita: json['texto_receita'],
    );
  }
}
