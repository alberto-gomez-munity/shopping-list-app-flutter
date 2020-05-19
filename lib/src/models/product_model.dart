// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String id;
    String ean;
    String slug;
    String brand;
    int limit;
    String origin;
    List<Photo> photos;
    Details details;
    String packaging;
    bool published;
    String shareUrl;
    String thumbnail;
    List<CategoryProduct> categories;
    List<dynamic> extraInfo;
    String displayName;
    bool isVariableWeight;
    PriceInstructions priceInstructions;
    NutritionInformation nutritionInformation;

    ProductModel({
        this.id,
        this.ean,
        this.slug,
        this.brand,
        this.limit,
        this.origin,
        this.photos,
        this.details,
        this.packaging,
        this.published,
        this.shareUrl,
        this.thumbnail,
        this.categories,
        this.extraInfo,
        this.displayName,
        this.isVariableWeight,
        this.priceInstructions,
        this.nutritionInformation,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] == null ? null : json["id"],
        ean: json["ean"] == null ? null : json["ean"],
        slug: json["slug"] == null ? null : json["slug"],
        brand: json["brand"] == null ? null : json["brand"],
        limit: json["limit"] == null ? null : json["limit"],
        origin: json["origin"] == null ? null : json["origin"],
        photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        packaging: json["packaging"] == null ? null : json["packaging"],
        published: json["published"] == null ? null : json["published"],
        shareUrl: json["share_url"] == null ? null : json["share_url"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        categories: json["categories"] == null ? null : List<CategoryProduct>.from(json["categories"].map((x) => CategoryProduct.fromJson(x))),
        extraInfo: json["extra_info"] == null ? null : List<dynamic>.from(json["extra_info"].map((x) => x)),
        displayName: json["display_name"] == null ? null : json["display_name"],
        isVariableWeight: json["is_variable_weight"] == null ? null : json["is_variable_weight"],
        priceInstructions: json["price_instructions"] == null ? null : PriceInstructions.fromJson(json["price_instructions"]),
        nutritionInformation: json["nutrition_information"] == null ? null : NutritionInformation.fromJson(json["nutrition_information"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ean": ean == null ? null : ean,
        "slug": slug == null ? null : slug,
        "brand": brand == null ? null : brand,
        "limit": limit == null ? null : limit,
        "origin": origin == null ? null : origin,
        "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
        "details": details == null ? null : details.toJson(),
        "packaging": packaging == null ? null : packaging,
        "published": published == null ? null : published,
        "share_url": shareUrl == null ? null : shareUrl,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
        "extra_info": extraInfo == null ? null : List<dynamic>.from(extraInfo.map((x) => x)),
        "display_name": displayName == null ? null : displayName,
        "is_variable_weight": isVariableWeight == null ? null : isVariableWeight,
        "price_instructions": priceInstructions == null ? null : priceInstructions.toJson(),
        "nutrition_information": nutritionInformation == null ? null : nutritionInformation.toJson(),
    };
}

class CategoryProduct {
    int id;
    String name;
    int level;
    int order;
    List<CategoryProduct> categories;

    CategoryProduct({
        this.id,
        this.name,
        this.level,
        this.order,
        this.categories,
    });

    factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        level: json["level"] == null ? null : json["level"],
        order: json["order"] == null ? null : json["order"],
        categories: json["categories"] == null ? null : List<CategoryProduct>.from(json["categories"].map((x) => CategoryProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "level": level == null ? null : level,
        "order": order == null ? null : order,
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Details {
    String brand;
    String origin;
    List<Supplier> suppliers;
    String legalName;
    String description;
    dynamic counterInfo;
    dynamic dangerMentions;
    dynamic alcoholByVolume;
    String mandatoryMentions;
    dynamic productionVariant;
    String usageInstructions;
    String storageInstructions;

    Details({
        this.brand,
        this.origin,
        this.suppliers,
        this.legalName,
        this.description,
        this.counterInfo,
        this.dangerMentions,
        this.alcoholByVolume,
        this.mandatoryMentions,
        this.productionVariant,
        this.usageInstructions,
        this.storageInstructions,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        brand: json["brand"] == null ? null : json["brand"],
        origin: json["origin"] == null ? null : json["origin"],
        suppliers: json["suppliers"] == null ? null : List<Supplier>.from(json["suppliers"].map((x) => Supplier.fromJson(x))),
        legalName: json["legal_name"] == null ? null : json["legal_name"],
        description: json["description"] == null ? null : json["description"],
        counterInfo: json["counter_info"],
        dangerMentions: json["danger_mentions"],
        alcoholByVolume: json["alcohol_by_volume"],
        mandatoryMentions: json["mandatory_mentions"] == null ? null : json["mandatory_mentions"],
        productionVariant: json["production_variant"],
        usageInstructions: json["usage_instructions"] == null ? null : json["usage_instructions"],
        storageInstructions: json["storage_instructions"] == null ? null : json["storage_instructions"],
    );

    Map<String, dynamic> toJson() => {
        "brand": brand == null ? null : brand,
        "origin": origin == null ? null : origin,
        "suppliers": suppliers == null ? null : List<dynamic>.from(suppliers.map((x) => x.toJson())),
        "legal_name": legalName == null ? null : legalName,
        "description": description == null ? null : description,
        "counter_info": counterInfo,
        "danger_mentions": dangerMentions,
        "alcohol_by_volume": alcoholByVolume,
        "mandatory_mentions": mandatoryMentions == null ? null : mandatoryMentions,
        "production_variant": productionVariant,
        "usage_instructions": usageInstructions == null ? null : usageInstructions,
        "storage_instructions": storageInstructions == null ? null : storageInstructions,
    };
}

class Supplier {
    String name;

    Supplier({
        this.name,
    });

    factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
    };
}

class NutritionInformation {
    String allergens;
    String ingredients;

    NutritionInformation({
        this.allergens,
        this.ingredients,
    });

    factory NutritionInformation.fromJson(Map<String, dynamic> json) => NutritionInformation(
        allergens: json["allergens"] == null ? null : json["allergens"],
        ingredients: json["ingredients"] == null ? null : json["ingredients"],
    );

    Map<String, dynamic> toJson() => {
        "allergens": allergens == null ? null : allergens,
        "ingredients": ingredients == null ? null : ingredients,
    };
}

class Photo {
    String zoom;
    String regular;
    String thumbnail;
    int perspective;

    Photo({
        this.zoom,
        this.regular,
        this.thumbnail,
        this.perspective,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        zoom: json["zoom"] == null ? null : json["zoom"],
        regular: json["regular"] == null ? null : json["regular"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        perspective: json["perspective"] == null ? null : json["perspective"],
    );

    Map<String, dynamic> toJson() => {
        "zoom": zoom == null ? null : zoom,
        "regular": regular == null ? null : regular,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "perspective": perspective == null ? null : perspective,
    };
}

class PriceInstructions {
    int iva;
    bool isNew;
    bool isPack;
    double packSize;
    String unitName;
    double unitSize;
    String bulkPrice;
    String unitPrice;
    bool approxSize;
    String sizeFormat;
    int totalUnits;
    bool unitSelector;
    bool bunchSelector;
    dynamic drainedWeight;
    int sellingMethod;
    bool priceDecreased;
    String referencePrice;
    int minBunchAmount;
    String referenceFormat;
    int incrementBunchAmount;

    PriceInstructions({
        this.iva,
        this.isNew,
        this.isPack,
        this.packSize,
        this.unitName,
        this.unitSize,
        this.bulkPrice,
        this.unitPrice,
        this.approxSize,
        this.sizeFormat,
        this.totalUnits,
        this.unitSelector,
        this.bunchSelector,
        this.drainedWeight,
        this.sellingMethod,
        this.priceDecreased,
        this.referencePrice,
        this.minBunchAmount,
        this.referenceFormat,
        this.incrementBunchAmount,
    });

    factory PriceInstructions.fromJson(Map<String, dynamic> json) => PriceInstructions(
        iva: json["iva"] == null ? null : json["iva"],
        isNew: json["is_new"] == null ? null : json["is_new"],
        isPack: json["is_pack"] == null ? null : json["is_pack"],
        packSize: json["pack_size"] == null ? null : json["pack_size"].toDouble(),
        unitName: json["unit_name"] == null ? null : json["unit_name"],
        unitSize: json["unit_size"] == null ? null : json["unit_size"].toDouble(),
        bulkPrice: json["bulk_price"] == null ? null : json["bulk_price"],
        unitPrice: json["unit_price"] == null ? null : json["unit_price"],
        approxSize: json["approx_size"] == null ? null : json["approx_size"],
        sizeFormat: json["size_format"] == null ? null : json["size_format"],
        totalUnits: json["total_units"] == null ? null : json["total_units"],
        unitSelector: json["unit_selector"] == null ? null : json["unit_selector"],
        bunchSelector: json["bunch_selector"] == null ? null : json["bunch_selector"],
        drainedWeight: json["drained_weight"],
        sellingMethod: json["selling_method"] == null ? null : json["selling_method"],
        priceDecreased: json["price_decreased"] == null ? null : json["price_decreased"],
        referencePrice: json["reference_price"] == null ? null : json["reference_price"],
        minBunchAmount: json["min_bunch_amount"] == null ? null : json["min_bunch_amount"],
        referenceFormat: json["reference_format"] == null ? null : json["reference_format"],
        incrementBunchAmount: json["increment_bunch_amount"] == null ? null : json["increment_bunch_amount"],
    );

    Map<String, dynamic> toJson() => {
        "iva": iva == null ? null : iva,
        "is_new": isNew == null ? null : isNew,
        "is_pack": isPack == null ? null : isPack,
        "pack_size": packSize == null ? null : packSize,
        "unit_name": unitName == null ? null : unitName,
        "unit_size": unitSize == null ? null : unitSize,
        "bulk_price": bulkPrice == null ? null : bulkPrice,
        "unit_price": unitPrice == null ? null : unitPrice,
        "approx_size": approxSize == null ? null : approxSize,
        "size_format": sizeFormat == null ? null : sizeFormat,
        "total_units": totalUnits == null ? null : totalUnits,
        "unit_selector": unitSelector == null ? null : unitSelector,
        "bunch_selector": bunchSelector == null ? null : bunchSelector,
        "drained_weight": drainedWeight,
        "selling_method": sellingMethod == null ? null : sellingMethod,
        "price_decreased": priceDecreased == null ? null : priceDecreased,
        "reference_price": referencePrice == null ? null : referencePrice,
        "min_bunch_amount": minBunchAmount == null ? null : minBunchAmount,
        "reference_format": referenceFormat == null ? null : referenceFormat,
        "increment_bunch_amount": incrementBunchAmount == null ? null : incrementBunchAmount,
    };
}
