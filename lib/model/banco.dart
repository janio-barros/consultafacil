class Banco {
  final String ispb;
  final String name;
  final int code;
  final String fullName;

  Banco(this.ispb, this.name, this.code, this.fullName);

  factory Banco.fromJson(Map<String, dynamic> json) {
    if (json['ispb'] == null) {
      return Banco("", "", -1, "");
    } else {
      // tratamento do json

      if (json['code'] == null) {
        json['code'] = 0;
      }
      if (json['name'] == null) {
        json['name'] = '';
      }
      if (json['ispb'] == null) {
        json['ispb'] = '';
      }
      if (json['fullName'] == null) {
        json['fullName'] = '';
      }

      return Banco(
        json['ispb'],
        json['name'],
        json['code'] as int,
        json['fullName'],
      );
    }
    /*return Banco(
      json['isbp'],
      json['name'],
      int.parse(json['code']),
      json['fullName'],
    );*/
  }

  Map<String, dynamic> toJson() => {
        'ispb': ispb,
        'name': name,
        'code': code,
        'fullName': fullName,
      };
/*
  {

    "ispb": "00000000",
    "name": "BCO DO BRASIL S.A.",
    "code": 1,
    "fullName": "Banco do Brasil S.A."

}*/
}
