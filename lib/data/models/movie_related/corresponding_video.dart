class VideoInfo {
  String? name;
  String? key;
  String? site;

  VideoInfo({this.name, this.key, this.site});

  VideoInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
    site = json['site'];
  }
}
