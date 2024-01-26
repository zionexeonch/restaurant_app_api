import 'restaurants_detail_model.dart';

class PostReviewResult {
  PostReviewResult({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  bool error;
  String message;
  List<CustomerReview> customerReviews;

  factory PostReviewResult.fromJson(Map<String, dynamic> json) =>
      PostReviewResult(
        error: json["error"] as bool,
        message: json["message"] as String,
        customerReviews: (json["customerReviews"] as List<dynamic>)
            .map((x) => CustomerReview.fromJson(x as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "customerReviews": customerReviews.map((x) => x.toJson()).toList(),
      };
}
