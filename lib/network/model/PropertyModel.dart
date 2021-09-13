class ProperityModel {
  int id;
  String name;
  int nbBedrooms;
  int nbBathrooms;
  String image;
  Prices prices;

  ProperityModel(
      {this.id,
        this.name,
        this.nbBedrooms,
        this.nbBathrooms,
        this.image,
        this.prices});

  ProperityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    nbBedrooms = json['Nb Bedrooms'];
    nbBathrooms = json['Nb Bathrooms'];
    image = json['Image'];
    prices =
    json['Prices'] != null ? new Prices.fromJson(json['Prices']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Nb Bedrooms'] = this.nbBedrooms;
    data['Nb Bathrooms'] = this.nbBathrooms;
    data['Image'] = this.image;
    if (this.prices != null) {
      data['Prices'] = this.prices.toJson();
    }
    return data;
  }
}

class Prices {
  int i10012021;
  int i10022021;
  int i10032021;
  int i10042021;
  int i10052021;
  int i10062021;
  int i10072021;
  int i10082021;
  int i10092021;
  int i10102021;
  int i10112021;
  int i10122021;
  int i10132021;
  int i10142021;
  int i10152021;
  int i10162021;
  int i10172021;
  int i10182021;
  int i10192021;
  int i10202021;
  int i10212021;
  int i10222021;
  int i10232021;
  int i10242021;
  int i10252021;
  int i10262021;
  int i10272021;
  int i10282021;
  int i10292021;
  int i10302021;
  int i10312021;
  int i11012021;
  int i11022021;
  int i11032021;
  int i11042021;
  int i11052021;
  int i11062021;
  int i11072021;
  int i11082021;
  int i11092021;
  int i11102021;
  int i11112021;
  int i11122021;
  int i11132021;
  int i11142021;
  int i11152021;
  int i11162021;
  int i11172021;
  int i11182021;
  int i11192021;
  int i11202021;
  int i11212021;
  int i11222021;
  int i11232021;
  int i11242021;
  int i11252021;
  int i11262021;
  int i11272021;
  int i11282021;
  int i11292021;
  int i11302021;

  Prices(
      {this.i10012021,
        this.i10022021,
        this.i10032021,
        this.i10042021,
        this.i10052021,
        this.i10062021,
        this.i10072021,
        this.i10082021,
        this.i10092021,
        this.i10102021,
        this.i10112021,
        this.i10122021,
        this.i10132021,
        this.i10142021,
        this.i10152021,
        this.i10162021,
        this.i10172021,
        this.i10182021,
        this.i10192021,
        this.i10202021,
        this.i10212021,
        this.i10222021,
        this.i10232021,
        this.i10242021,
        this.i10252021,
        this.i10262021,
        this.i10272021,
        this.i10282021,
        this.i10292021,
        this.i10302021,
        this.i10312021,
        this.i11012021,
        this.i11022021,
        this.i11032021,
        this.i11042021,
        this.i11052021,
        this.i11062021,
        this.i11072021,
        this.i11082021,
        this.i11092021,
        this.i11102021,
        this.i11112021,
        this.i11122021,
        this.i11132021,
        this.i11142021,
        this.i11152021,
        this.i11162021,
        this.i11172021,
        this.i11182021,
        this.i11192021,
        this.i11202021,
        this.i11212021,
        this.i11222021,
        this.i11232021,
        this.i11242021,
        this.i11252021,
        this.i11262021,
        this.i11272021,
        this.i11282021,
        this.i11292021,
        this.i11302021});

  Prices.fromJson(Map<String, dynamic> json) {
    i10012021 = json['10/01/2021'];
    i10022021 = json['10/02/2021'];
    i10032021 = json['10/03/2021'];
    i10042021 = json['10/04/2021'];
    i10052021 = json['10/05/2021'];
    i10062021 = json['10/06/2021'];
    i10072021 = json['10/07/2021'];
    i10082021 = json['10/08/2021'];
    i10092021 = json['10/09/2021'];
    i10102021 = json['10/10/2021'];
    i10112021 = json['10/11/2021'];
    i10122021 = json['10/12/2021'];
    i10132021 = json['10/13/2021'];
    i10142021 = json['10/14/2021'];
    i10152021 = json['10/15/2021'];
    i10162021 = json['10/16/2021'];
    i10172021 = json['10/17/2021'];
    i10182021 = json['10/18/2021'];
    i10192021 = json['10/19/2021'];
    i10202021 = json['10/20/2021'];
    i10212021 = json['10/21/2021'];
    i10222021 = json['10/22/2021'];
    i10232021 = json['10/23/2021'];
    i10242021 = json['10/24/2021'];
    i10252021 = json['10/25/2021'];
    i10262021 = json['10/26/2021'];
    i10272021 = json['10/27/2021'];
    i10282021 = json['10/28/2021'];
    i10292021 = json['10/29/2021'];
    i10302021 = json['10/30/2021'];
    i10312021 = json['10/31/2021'];
    i11012021 = json['11/01/2021'];
    i11022021 = json['11/02/2021'];
    i11032021 = json['11/03/2021'];
    i11042021 = json['11/04/2021'];
    i11052021 = json['11/05/2021'];
    i11062021 = json['11/06/2021'];
    i11072021 = json['11/07/2021'];
    i11082021 = json['11/08/2021'];
    i11092021 = json['11/09/2021'];
    i11102021 = json['11/10/2021'];
    i11112021 = json['11/11/2021'];
    i11122021 = json['11/12/2021'];
    i11132021 = json['11/13/2021'];
    i11142021 = json['11/14/2021'];
    i11152021 = json['11/15/2021'];
    i11162021 = json['11/16/2021'];
    i11172021 = json['11/17/2021'];
    i11182021 = json['11/18/2021'];
    i11192021 = json['11/19/2021'];
    i11202021 = json['11/20/2021'];
    i11212021 = json['11/21/2021'];
    i11222021 = json['11/22/2021'];
    i11232021 = json['11/23/2021'];
    i11242021 = json['11/24/2021'];
    i11252021 = json['11/25/2021'];
    i11262021 = json['11/26/2021'];
    i11272021 = json['11/27/2021'];
    i11282021 = json['11/28/2021'];
    i11292021 = json['11/29/2021'];
    i11302021 = json['11/30/2021'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['10/01/2021'] = this.i10012021;
    data['10/02/2021'] = this.i10022021;
    data['10/03/2021'] = this.i10032021;
    data['10/04/2021'] = this.i10042021;
    data['10/05/2021'] = this.i10052021;
    data['10/06/2021'] = this.i10062021;
    data['10/07/2021'] = this.i10072021;
    data['10/08/2021'] = this.i10082021;
    data['10/09/2021'] = this.i10092021;
    data['10/10/2021'] = this.i10102021;
    data['10/11/2021'] = this.i10112021;
    data['10/12/2021'] = this.i10122021;
    data['10/13/2021'] = this.i10132021;
    data['10/14/2021'] = this.i10142021;
    data['10/15/2021'] = this.i10152021;
    data['10/16/2021'] = this.i10162021;
    data['10/17/2021'] = this.i10172021;
    data['10/18/2021'] = this.i10182021;
    data['10/19/2021'] = this.i10192021;
    data['10/20/2021'] = this.i10202021;
    data['10/21/2021'] = this.i10212021;
    data['10/22/2021'] = this.i10222021;
    data['10/23/2021'] = this.i10232021;
    data['10/24/2021'] = this.i10242021;
    data['10/25/2021'] = this.i10252021;
    data['10/26/2021'] = this.i10262021;
    data['10/27/2021'] = this.i10272021;
    data['10/28/2021'] = this.i10282021;
    data['10/29/2021'] = this.i10292021;
    data['10/30/2021'] = this.i10302021;
    data['10/31/2021'] = this.i10312021;
    data['11/01/2021'] = this.i11012021;
    data['11/02/2021'] = this.i11022021;
    data['11/03/2021'] = this.i11032021;
    data['11/04/2021'] = this.i11042021;
    data['11/05/2021'] = this.i11052021;
    data['11/06/2021'] = this.i11062021;
    data['11/07/2021'] = this.i11072021;
    data['11/08/2021'] = this.i11082021;
    data['11/09/2021'] = this.i11092021;
    data['11/10/2021'] = this.i11102021;
    data['11/11/2021'] = this.i11112021;
    data['11/12/2021'] = this.i11122021;
    data['11/13/2021'] = this.i11132021;
    data['11/14/2021'] = this.i11142021;
    data['11/15/2021'] = this.i11152021;
    data['11/16/2021'] = this.i11162021;
    data['11/17/2021'] = this.i11172021;
    data['11/18/2021'] = this.i11182021;
    data['11/19/2021'] = this.i11192021;
    data['11/20/2021'] = this.i11202021;
    data['11/21/2021'] = this.i11212021;
    data['11/22/2021'] = this.i11222021;
    data['11/23/2021'] = this.i11232021;
    data['11/24/2021'] = this.i11242021;
    data['11/25/2021'] = this.i11252021;
    data['11/26/2021'] = this.i11262021;
    data['11/27/2021'] = this.i11272021;
    data['11/28/2021'] = this.i11282021;
    data['11/29/2021'] = this.i11292021;
    data['11/30/2021'] = this.i11302021;
    return data;
  }
}
