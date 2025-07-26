import 'package:json_annotation/json_annotation.dart';

part 'src.g.dart';

@JsonSerializable()
class Src {
  @JsonKey(name: "original")
  final String? original;
  @JsonKey(name: "large2x")
  final String? large2x;
  @JsonKey(name: "large")
  final String? large;
  @JsonKey(name: "medium")
  final String? medium;
  @JsonKey(name: "small")
  final String? small;
  @JsonKey(name: "portrait")
  final String? portrait;
  @JsonKey(name: "landscape")
  final String? landscape;
  @JsonKey(name: "tiny")
  final String? tiny;

  Src({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return _$SrcFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SrcToJson(this);
  }
}
