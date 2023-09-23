// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  List<dynamic>? facetCounts;
  int? found;
  List<Hit>? hits;
  int? outOf;
  int? page;
  RequestParams? requestParams;
  bool? searchCutoff;
  int? searchTimeMs;

  ProductsModel({
    this.facetCounts,
    this.found,
    this.hits,
    this.outOf,
    this.page,
    this.requestParams,
    this.searchCutoff,
    this.searchTimeMs,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        facetCounts: json["facet_counts"] == null
            ? []
            : List<dynamic>.from(json["facet_counts"]!.map((x) => x)),
        found: json["found"],
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
        outOf: json["out_of"],
        page: json["page"],
        requestParams: json["request_params"] == null
            ? null
            : RequestParams.fromJson(json["request_params"]),
        searchCutoff: json["search_cutoff"],
        searchTimeMs: json["search_time_ms"],
      );

  Map<String, dynamic> toJson() => {
        "facet_counts": facetCounts == null
            ? []
            : List<dynamic>.from(facetCounts!.map((x) => x)),
        "found": found,
        "hits": hits == null
            ? []
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
        "out_of": outOf,
        "page": page,
        "request_params": requestParams?.toJson(),
        "search_cutoff": searchCutoff,
        "search_time_ms": searchTimeMs,
      };
}

class Hit {
  Document? document;
  List<dynamic>? highlights;
  int? textMatch;

  Hit({
    this.document,
    this.highlights,
    this.textMatch,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        document: json["document"] == null
            ? null
            : Document.fromJson(json["document"]),
        highlights: json["highlights"] == null
            ? []
            : List<dynamic>.from(json["highlights"]!.map((x) => x)),
        textMatch: json["text_match"],
      );

  Map<String, dynamic> toJson() => {
        "document": document?.toJson(),
        "highlights": highlights == null
            ? []
            : List<dynamic>.from(highlights!.map((x) => x)),
        "text_match": textMatch,
      };
}

class Document {
  Category? category;
  int? datetime;
  String? headline;
  int? id;
  String? image;
  String? related;
  Source? source;
  String? summary;
  String? url;
  String? documentId;

  Document({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
    this.documentId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        category: categoryValues.map[json["Category"]]!,
        datetime: json["Datetime"],
        headline: json["Headline"],
        id: json["ID"],
        image: json["Image"],
        related: json["Related"],
        source: sourceValues.map[json["Source"]]!,
        summary: json["Summary"],
        url: json["URL"],
        documentId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Category": categoryValues.reverse[category],
        "Datetime": datetime,
        "Headline": headline,
        "ID": id,
        "Image": image,
        "Related": related,
        "Source": sourceValues.reverse[source],
        "Summary": summary,
        "URL": url,
        "id": documentId,
      };
}

enum Category { BUSINESS, TOP_NEWS }

final categoryValues =
    EnumValues({"business": Category.BUSINESS, "top news": Category.TOP_NEWS});

enum Source { BLOOMBERG, CNBC, MARKET_WATCH }

final sourceValues = EnumValues({
  "Bloomberg": Source.BLOOMBERG,
  "CNBC": Source.CNBC,
  "MarketWatch": Source.MARKET_WATCH
});

class RequestParams {
  String? collectionName;
  int? perPage;
  String? q;

  RequestParams({
    this.collectionName,
    this.perPage,
    this.q,
  });

  factory RequestParams.fromJson(Map<String, dynamic> json) => RequestParams(
        collectionName: json["collection_name"],
        perPage: json["per_page"],
        q: json["q"],
      );

  Map<String, dynamic> toJson() => {
        "collection_name": collectionName,
        "per_page": perPage,
        "q": q,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
