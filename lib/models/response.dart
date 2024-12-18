class Response {
  Object? data;
  String status;
  String message;

  Response({
     this.data,
    required this.status,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'message': message,
      'status': status
    };
  }

}
