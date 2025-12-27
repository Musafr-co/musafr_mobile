class ReviewDto {
  double? reviewStars;
  int? reviewCounts;

  ReviewDto({this.reviewCounts, this.reviewStars});

  factory ReviewDto.fromJson(Map<String, dynamic> json) {
    return ReviewDto(
      reviewCounts: json['reviewCounts'],
      reviewStars: json['reviewStars'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'reviewCounts': reviewCounts, 'reviewStars': reviewStars};
  }
}
