class Response {
  Object? data; // Primary key, optional as it will be auto-generated
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
