import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'network_manager.dart';
import 'package:dio/dio.dart';

part 'network_provider.g.dart';

@riverpod
Dio networkService(Ref ref) {
  return NetworkManager.instance.dio;
}
