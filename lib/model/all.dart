/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
class Table {
  String tableName;
  Table();
  Map<String, dynamic> toJson() {}
  Table.fromJson(Map<String, dynamic> map);
}
class All {
  List<Ism> ism;
  List<Tarifs> tarifs;
  List<Category> category;

  All({this.ism, this.tarifs, this.category});

  All.fromJson(Map<String, dynamic> json) {
    if (json['ism'] != null) {
      ism = new List<Ism>();
      json['ism'].forEach((v) {
        if (v['companyid'] == "4")
          ism.add(new Ism.fromJson(v));
      });
    }
    if (json['tarifs'] != null) {
      tarifs = new List<Tarifs>();
      json['tarifs'].forEach((v) {
        if (v['companyid'] == "4")
          tarifs.add(new Tarifs.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        if (v['companyid'] == "4")
          category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ism != null) {
      data['ism'] = this.ism.map((v) => v.toJson()).toList();
    }
    if (this.tarifs != null) {
      data['tarifs'] = this.tarifs.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ism {
  String id;
  String price;
  String titleUz;
  String titleRu;
  String kod;
  String catid;
  String type;
  String descUz;
  String descRu;
  String status;


  Ism(
      {this.id,
        this.price,
        this.titleUz,
        this.titleRu,
        this.kod,
        this.catid,
        this.type,
        this.descUz,
        this.descRu,
        this.status,
        });

  Ism.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    price = json['price'];
    titleUz = json['title_uz'];
    titleRu = json['title_ru'];
    kod = json['kod'];
    catid = json['catid'];
    type = json['type'];
    descUz = json['desc_uz'];
    descRu = json['desc_ru'];
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['title_uz'] = this.titleUz;
    data['title_ru'] = this.titleRu;
    data['kod'] = this.kod;
    data['catid'] = this.catid;
    data['type'] = this.type;
    data['desc_uz'] = this.descUz;
    data['desc_ru'] = this.descRu;
    data['status'] = this.status;

    return data;
  }
  static String tableName = "Ism";
}

class Tarifs {
  String id;
  String name;
  String titleUz;
  String titleRu;
  String kod;
  String photo;
  String descrUz;
  String descrRu;
  String summa;
  String status;
  String torder;


  Tarifs(
      {this.id,
        this.name,
        this.titleUz,
        this.titleRu,
        this.kod,
        this.photo,
        this.descrUz,
        this.descrRu,
        this.summa,
        this.status,
        this.torder,
        });

  Tarifs.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    titleUz = json['title_uz'];
    titleRu = json['title_ru'];
    kod = json['kod'];
    photo = json['photo'];
    descrUz = json['descr_uz'];
    descrRu = json['descr_ru'];
    summa = json['summa'];
    status = json['status'];
    torder = json['order'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title_uz'] = this.titleUz;
    data['title_ru'] = this.titleRu;
    data['kod'] = this.kod;
    data['photo'] = this.photo;
    data['descr_uz'] = this.descrUz;
    data['descr_ru'] = this.descrRu;
    data['summa'] = this.summa;
    data['status'] = this.status;
    data['torder'] = this.torder;

    return data;
  }
  static String tableName = "Tarifs";
}

class Category {
  String id;
  String catUz;
  String catRu;
  String kod;
  String torder;
  String type;

  Category(
      {this.id,
        this.catUz,
        this.catRu,
        this.kod,
        this.torder,

        this.type});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    catUz = json['cat_uz'];
    catRu = json['cat_ru'];
    kod = json['kod'];
    torder = json['torder'];

    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_uz'] = this.catUz;
    data['cat_ru'] = this.catRu;
    data['kod'] = this.kod;
    data['torder'] = this.torder;
    data['type'] = this.type;
    return data;
  }
  static String tableName = "Category";

}