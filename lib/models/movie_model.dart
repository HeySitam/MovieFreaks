class Movie{
final String title;
final String posterUrl;
const Movie({required this.title,required this.posterUrl});
 factory Movie.fromJson(Map<String,dynamic> json){
   return Movie(
     title: json["Title"],
     posterUrl: json["Poster"]
   );
 }
}