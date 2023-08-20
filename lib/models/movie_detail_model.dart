class MovieDetailModel {
  final bool adult, video;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title,
      status,
      tagline,
      imdbId,
      homepage;
  final int id, voteCount, runtime, revenue, budget;
  final double popularity, voteAverage;
  final dynamic belongsToCollection, genres;
  final List<dynamic> productionCompanies, productionCountries, spokenLanguages;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imdbId = json['imdb_id'],
        title = json['title'],
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'],
        overview = json['overview'],
        releaseDate = json['release_date'],
        runtime = json['runtime'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'],
        genres = json['genres'],
        adult = json['adult'],
        video = json['video'],
        popularity = json['popularity'],
        originalTitle = json['original_title'],
        originalLanguage = json['original_language'],
        revenue = json['revenue'],
        budget = json['budget'],
        status = json['status'],
        tagline = json['tagline'],
        belongsToCollection = json['belongs_to_collection'],
        productionCompanies = json['production_companies'],
        productionCountries = json['production_countries'],
        spokenLanguages = json['spoken_languages'],
        homepage = json['homepage'];
}
