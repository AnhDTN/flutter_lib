// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    minSalary: json['minSalary'] as int?,
    maxSalary: json['maxSalary'] as int?,
    deadline: json['deadline'] as String?,
    viewCount: json['viewCount'] as int?,
    yearExperience: json['yearExperience'] as int?,
    requirement: json['requirement'] as String?,
    benefit: json['benefit'] as String?,
    totalRecruitment: json['totalRecruitment'] as int?,
    scheduled: json['scheduled'] as String?,
    refusal: json['refusal'] as String?,
    workType: json['workType'] as String?,
    status: json['status'] as String?,
    displayed: json['displayed'] as bool?,
    receiverName: json['receiverName'] as String?,
    receiverEmail: json['receiverEmail'] as String?,
    receiverPhone: json['receiverPhone'] as String?,
    gender: json['gender'] as int?,
    createdAt: json['createdAt'] as String?,
    createdById: json['createdById'] as int?,
    approvedById: json['approvedById'] as int?,
    companyBranchId: json['companyBranchId'] as int?,
    levelId: json['levelId'] as int?,
    totalApplicants: json['totalApplicants'] as int?,
    liked: json['liked'] as bool?,
    applied: json['applied'] as bool?,
    favorited: json['favorited'] as bool?,
    matchedPercent: json['matchedPercent'] as int?,
    featured: json['featured'] as bool?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'minSalary': instance.minSalary,
      'maxSalary': instance.maxSalary,
      'deadline': instance.deadline,
      'viewCount': instance.viewCount,
      'yearExperience': instance.yearExperience,
      'requirement': instance.requirement,
      'benefit': instance.benefit,
      'totalRecruitment': instance.totalRecruitment,
      'scheduled': instance.scheduled,
      'refusal': instance.refusal,
      'workType': instance.workType,
      'status': instance.status,
      'displayed': instance.displayed,
      'receiverName': instance.receiverName,
      'receiverEmail': instance.receiverEmail,
      'receiverPhone': instance.receiverPhone,
      'gender': instance.gender,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'approvedById': instance.approvedById,
      'companyBranchId': instance.companyBranchId,
      'levelId': instance.levelId,
      'featured': instance.featured,
      'totalApplicants': instance.totalApplicants,
      'liked': instance.liked,
      'favorited': instance.favorited,
      'applied': instance.applied,
      'matchedPercent': instance.matchedPercent,
    };
