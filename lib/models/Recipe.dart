class Recipe {
  String? idMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;
  String? strImageSource;
  dynamic strCreativeCommonsConfirmed;
  dynamic dateModified;

  String? getIngredient(int index) {
    switch (index) {
      case 1:
        return strIngredient1;
      case 2:
        return strIngredient2;
      case 3:
        return strIngredient3;
      case 4:
        return strIngredient4;
      case 5:
        return strIngredient5;
      case 6:
        return strIngredient6;
      case 7:
        return strIngredient7;
      case 8:
        return strIngredient8;
      case 9:
        return strIngredient9;
      case 10:
        return strIngredient10;
      case 11:
        return strIngredient11;
      case 12:
        return strIngredient12;
      case 13:
        return strIngredient13;
      case 14:
        return strIngredient14;
      case 15:
        return strIngredient15;
      case 16:
        return strIngredient16;
      case 17:
        return strIngredient17;
      case 18:
        return strIngredient18;
      case 19:
        return strIngredient19;
      case 20:
        return strIngredient20;
      default:
        return null;
    }
  }

  String? getMeasure(int index) {
    switch (index) {
      case 1:
        return strMeasure1;
      case 2:
        return strMeasure2;
      case 3:
        return strMeasure3;
      case 4:
        return strMeasure4;
      case 5:
        return strMeasure5;
      case 6:
        return strMeasure6;
      case 7:
        return strMeasure7;
      case 8:
        return strMeasure8;
      case 9:
        return strMeasure9;
      case 10:
        return strMeasure10;
      case 11:
        return strMeasure11;
      case 12:
        return strMeasure12;
      case 13:
        return strMeasure13;
      case 14:
        return strMeasure14;
      case 15:
        return strMeasure15;
      case 16:
        return strMeasure16;
      case 17:
        return strMeasure17;
      case 18:
        return strMeasure18;
      case 19:
        return strMeasure19;
      case 20:
        return strMeasure20;
      default:
        return null;
    }
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strDrinkAlternate = json['strDrinkAlternate'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
    strYoutube = json['strYoutube'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
    strIngredient6 = json['strIngredient6'];
    strIngredient7 = json['strIngredient7'];
    strIngredient8 = json['strIngredient8'];
    strIngredient9 = json['strIngredient9'];
    strIngredient10 = json['strIngredient10'];
    strIngredient11 = json['strIngredient11'];
    strIngredient12 = json['strIngredient12'];
    strIngredient13 = json['strIngredient13'];
    strIngredient14 = json['strIngredient14'];
    strIngredient15 = json['strIngredient15'];
    strIngredient16 = json['strIngredient16'];
    strIngredient17 = json['strIngredient17'];
    strIngredient18 = json['strIngredient18'];
    strIngredient19 = json['strIngredient19'];
    strIngredient20 = json['strIngredient20'];
    strMeasure1 = json['strMeasure1'];
    strMeasure2 = json['strMeasure2'];
    strMeasure3 = json['strMeasure3'];
    strMeasure4 = json['strMeasure4'];
    strMeasure5 = json['strMeasure5'];
    strMeasure6 = json['strMeasure6'];
    strMeasure7 = json['strMeasure7'];
    strMeasure8 = json['strMeasure8'];
    strMeasure9 = json['strMeasure9'];
    strMeasure10 = json['strMeasure10'];
    strMeasure11 = json['strMeasure11'];
    strMeasure12 = json['strMeasure12'];
    strMeasure13 = json['strMeasure13'];
    strMeasure14 = json['strMeasure14'];
    strMeasure15 = json['strMeasure15'];
    strMeasure16 = json['strMeasure16'];
    strMeasure17 = json['strMeasure17'];
    strMeasure18 = json['strMeasure18'];
    strMeasure19 = json['strMeasure19'];
    strMeasure20 = json['strMeasure20'];
    strSource = json['strSource'];
    strImageSource = json['strImageSource'];
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
  }
}
