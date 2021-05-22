class DeathsModel {
  int totalCases;
  int totalDeaths;
  DeathsModel({this.totalCases, this.totalDeaths});
  DeathsModel.fromJson(Map<String, dynamic> json) {
    totalCases = json['today_confirmed'];
    totalDeaths = json['today_deaths'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today_confirmed'] = this.totalCases;
    data['today_deaths'] = this.totalDeaths;
  }
}
