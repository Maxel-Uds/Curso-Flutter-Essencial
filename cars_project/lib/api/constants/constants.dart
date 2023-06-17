class Constants {
  static const String _spriteUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork";
  static const String POKE_API_URL = "https://pokeapi.co/api/v2/pokemon";

  static String getSpriteUrl(String id) {
    return "$_spriteUrl/$id.png";
  }
}