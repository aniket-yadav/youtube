class Review {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;
  Review({
    this.comment,
    this.date,
    this.rating,
    this.reviewerEmail,
    this.reviewerName,
  });
  factory Review.fromJson(Map<String, dynamic>? json) => Review(
        comment: json?['comment'],
        date: json?['date'],
        rating: json?['rating'],
        reviewerEmail: json?['reviewerEmail'],
        reviewerName: json?['reviewerName'],
      );
}
