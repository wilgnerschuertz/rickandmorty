// import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// class CustomCacheManager extends BaseCacheManager {
//   static const key = "customCache";

//   static final CustomCacheManager _instance = CustomCacheManager._();

//   factory CustomCacheManager() {
//     return _instance;
//   }

//   CustomCacheManager._()
//       : super(key,
//             maxAgeCacheObject: Duration(
//                 days: 7), // Define o tempo de expiração do cache para 7 dias
//             maxNrOfCacheObjects: 100); // Limite máximo de objetos no cache

//   @override
//   Future<String> getFilePath() async {
//     var dir = await getTemporaryDirectory();
//     return p.join(dir.path, key);
//   }
// }
