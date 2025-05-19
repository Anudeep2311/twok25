import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "imageUrl")
  String? imageUrl;

  ProjectModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

  // You can optionally add this helper to include the document ID
  static ProjectModel fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final model = ProjectModel.fromJson(data);
    model.id = doc.id;
    return model;
  }
}
