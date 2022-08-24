/*
TO BUILD RUN

flutter  pub run build_runner build


*/


//  you can create by any name you want here my  data is list of characters

// so characters name is more suitable

// as  is said start from inner
//  oh! i forgot most import thing
//  adding annotatin
import 'package:json_annotation/json_annotation.dart'; // import this

//  1 more thing
//  this file show only our field and class and data type etc this is not actual data class
//  we will build that with command

// so  we have to declare that file name
//  format -part thisfilename.g.dart
//  here our file name is characters so characters.g.dart;
part 'characters.g.dart';

@JsonSerializable() // add this to your class
class Character {
  //  i prefer using null so that if i don't let value it will not break
  String? name;
  String? image;
  //  create default constructor
  Character({this.image, this.name});
//  this is a fix format / method  class.fromJson(Map<String,dynamic> json) => _$classNameFromJson(json);
// this is  to convert json into class object
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  //  now from class object to json
//  format-: Map<String,dynamic> toJson() => _$classNameToJson(this);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

//  okay we are done with inner most json class now 2 more
//  they are same

@JsonSerializable()
class Results {
  List<Character>? results; //this is list of character
  Results({this.results});
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

//  this is our outermost json to i named it as response
@JsonSerializable()
class CharactersResponse {
  Results? characters;

  CharactersResponse({this.characters});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
