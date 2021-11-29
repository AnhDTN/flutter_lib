import 'package:json_annotation/json_annotation.dart';
part 'job.g.dart';

@JsonSerializable()
class Job {
  int? id;
  String? title;
  String? description;
  int? minSalary;
  int? maxSalary;
  String? deadline;
  int? viewCount;
  int? yearExperience;
  String? requirement;
  String? benefit;
  int? totalRecruitment;
  String? scheduled;
  String? refusal;
  String? workType;
  String? status;
  bool? displayed;
  String? receiverName;
  String? receiverEmail;
  String? receiverPhone;
  int? gender;
  String? createdAt;
  String? updatedAt;
  int? createdById;
  int? approvedById;
  int? companyBranchId;
  int? levelId;
  bool? featured;
  int? totalApplicants;
  bool? liked;
  bool? favorited;
  bool? applied;
  int? matchedPercent;
  Job(
      {this.id,
        this.title,
        this.description,
        this.minSalary,
        this.maxSalary,
        this.deadline,
        this.viewCount,
        this.yearExperience,
        this.requirement,
        this.benefit,
        this.totalRecruitment,
        this.scheduled,
        this.refusal,
        this.workType,
        this.status,
        this.displayed,
        this.receiverName,
        this.receiverEmail,
        this.receiverPhone,
        this.gender,
        this.createdAt,
        this.createdById,
        this.approvedById,
        this.companyBranchId,
        this.levelId,
        this.totalApplicants,
        this.liked,
        this.applied,
        this.favorited,
        this.matchedPercent,
        this.featured,
        this.updatedAt});

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}
