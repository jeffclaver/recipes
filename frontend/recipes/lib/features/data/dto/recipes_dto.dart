class RecipesDto {
  RecipesDto({
    required this.id,
    required this.titulo,
    required this.textoReceita,
  });

  final int id;
  final String titulo;
  final String textoReceita;

  factory RecipesDto.fromJson(Map<String, dynamic> json) {
    return RecipesDto(
      id: json['id'],
      titulo: json['titulo'],
      textoReceita: json['texto_receita'],
    );
  }
}
