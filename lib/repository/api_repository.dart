import '../models/api_model.dart';
import '../services/api_service.dart';

class ApiRepository {
  final _provider = ApiService();

  Future fetchLanguagesList() {
    return _provider.fetchLanguages();
  }
}

class NetworkError extends Error {}