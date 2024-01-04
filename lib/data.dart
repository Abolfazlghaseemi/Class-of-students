import 'package:dio/dio.dart';

class StudentData {
  final int id;
  final String firsname;
  final String lastename;
  final String course;
  final int score;
  final String createdAt;
  final String updatedAt;

  StudentData(
      {required this.id,
      required this.firsname,
      required this.lastename,
      required this.course,
      required this.score,
      required this.createdAt,
      required this.updatedAt});
  StudentData.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        firsname = json['first_name'],
        lastename = json['last_name'],
        course = json['course'],
        score = json['score'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}

class HttpClient {
  static Dio instance =
      Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'));
}

Future<List<StudentData>> getStudent() async {
  final response = await HttpClient.instance.get('experts/student');
  print(response.data);
  final List<StudentData> students = [];
  if (response.data is List<dynamic>) {
    (response.data as List<dynamic>).forEach((element) {
      students.add(StudentData.fromjson(element));
    });
  }
  print(students.toString());
  return students;
}
