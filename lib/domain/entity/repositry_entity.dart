class RepositoryEntity {
  final int id;
  final String name;
  final String description;
  final int stargazersCount;
  bool isFavorite;

  RepositoryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.stargazersCount,
    this.isFavorite = false,
  });
}
