class Countries {
  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  List<String> altSpellings;
  String region;
  String subregion;
  List<double> latlng;
  String demonym;
  double area;
  double gini;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  List<Currencies> currencies;
  List<Languages> languages;
  Translations translations;
  String flag;
  String cioc;

  Countries(
      {this.name,
      this.topLevelDomain,
      this.alpha2Code,
      this.alpha3Code,
      this.callingCodes,
      this.capital,
      this.altSpellings,
      this.region,
      this.subregion,
      this.latlng,
      this.demonym,
      this.area,
      this.gini,
      this.timezones,
      this.borders,
      this.nativeName,
      this.numericCode,
      this.currencies,
      this.languages,
      this.translations,
      this.flag,
      this.cioc});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    topLevelDomain = json['topLevelDomain'].cast<String>();
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    callingCodes = json['callingCodes'].cast<String>();
    capital = json['capital'];
    altSpellings = json['altSpellings'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    latlng = json['latlng'].cast<double>();
    demonym = json['demonym'];
    area = json['area'];
    gini = json['gini'];
    timezones = json['timezones'].cast<String>();
    borders = json['borders'].cast<String>();
    nativeName = json['nativeName'];
    numericCode = json['numericCode'];
    if (json['currencies'] != null) {
      currencies = new List<Currencies>();
      json['currencies'].forEach((v) {
        currencies.add(new Currencies.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = new List<Languages>();
      json['languages'].forEach((v) {
        languages.add(new Languages.fromJson(v));
      });
    }
    translations = json['translations'] != null
        ? new Translations.fromJson(json['translations'])
        : null;
    flag = json['flag'];

    cioc = json['cioc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['topLevelDomain'] = this.topLevelDomain;
    data['alpha2Code'] = this.alpha2Code;
    data['alpha3Code'] = this.alpha3Code;
    data['callingCodes'] = this.callingCodes;
    data['capital'] = this.capital;
    data['altSpellings'] = this.altSpellings;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['latlng'] = this.latlng;
    data['demonym'] = this.demonym;
    data['area'] = this.area;
    data['gini'] = this.gini;
    data['timezones'] = this.timezones;
    data['borders'] = this.borders;
    data['nativeName'] = this.nativeName;
    data['numericCode'] = this.numericCode;
    if (this.currencies != null) {
      data['currencies'] = this.currencies.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations.toJson();
    }
    data['flag'] = this.flag;

    data['cioc'] = this.cioc;
    return data;
  }
}

class Currencies {
  String code;
  String name;
  String symbol;

  Currencies({this.code, this.name, this.symbol});

  Currencies.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Languages {
  String iso6391;
  String iso6392;
  String name;
  String nativeName;

  Languages({this.iso6391, this.iso6392, this.name, this.nativeName});

  Languages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso639_1'];
    iso6392 = json['iso639_2'];
    name = json['name'];
    nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso639_1'] = this.iso6391;
    data['iso639_2'] = this.iso6392;
    data['name'] = this.name;
    data['nativeName'] = this.nativeName;
    return data;
  }
}

class Translations {
  String de;
  String es;
  String fr;
  String ja;
  String it;
  String br;
  String pt;
  String nl;
  String hr;
  String fa;

  Translations(
      {this.de,
      this.es,
      this.fr,
      this.ja,
      this.it,
      this.br,
      this.pt,
      this.nl,
      this.hr,
      this.fa});

  Translations.fromJson(Map<String, dynamic> json) {
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    ja = json['ja'];
    it = json['it'];
    br = json['br'];
    pt = json['pt'];
    nl = json['nl'];
    hr = json['hr'];
    fa = json['fa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['de'] = this.de;
    data['es'] = this.es;
    data['fr'] = this.fr;
    data['ja'] = this.ja;
    data['it'] = this.it;
    data['br'] = this.br;
    data['pt'] = this.pt;
    data['nl'] = this.nl;
    data['hr'] = this.hr;
    data['fa'] = this.fa;
    return data;
  }
}
