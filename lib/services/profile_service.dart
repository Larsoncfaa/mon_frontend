import 'package:dio/dio.dart';
import '../models/profile.dart';

class ProfileService {
  final Dio _dio;

  ProfileService(this._dio);

  // GET /v1/profile/
  Future<Profile> fetchProfile() async {
    final response = await _dio.get('/profile/');
    return Profile.fromJson(response.data);
  }

  // PUT /v1/profile/
  Future<Profile> updateProfile(Profile profile) async {
    final response = await _dio.put(
      '/profile/',
      data: profile.toJson(),
    );
    return Profile.fromJson(response.data);
  }
}
