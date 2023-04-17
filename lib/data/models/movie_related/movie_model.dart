class Movie {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  String? voteCount;

  Movie(
      {
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.voteAverage,
        this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = double.parse(json['vote_average'].toString());
    voteCount = voteCountChecker(json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount.toString();
    return data;
  }

  String voteCountChecker(int data){
    final divider = 1000;
    final divResult = data/divider;
    if(divResult.floor() == 0){
      return data.toString();
    } else {
      return "${divResult.toStringAsFixed(1)}K";
    }
  }

}