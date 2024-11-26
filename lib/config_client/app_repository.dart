import 'package:bai_9a/config_client/app_client.dart';
import 'package:dio/dio.dart';

class AppRepository {
  Dio appClient = AppClient.instance.dio;
// Future<List<ItemCategory>> getCollageCat() async {
//   try {
//     final res = await appClient.get(ApiPath.apiGetCollageCat);
//     CollageCatRes? response = CollageCatRes.fromJson(res.data);
//     return response.data ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
//
// Future<List<ItemMenuSticker>?> getStickerCat() async {
//   try {
//     final res = await appClient.get(ApiPath.apiGetStickerCat);
//     MenuStickerRes? response = MenuStickerRes.fromJson(res.data);
//     return response.data;
//   } catch (e) {
//     logger.e(e);
//     return null;
//   }
// }
//
// Future<List<StickerItem>> getStickers({required StickerBody? body}) async {
//   try {
//     final res = await appClient.post(
//       ApiPath.apiGetSticker,
//       data: body?.toJson(),
//     );
//     ListStickersRes? response = ListStickersRes.fromJson(res.data);
//     return response.data?.listData ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
//
// Future<List<ItemTemplate>> getTemplateFrames({required CategoryBody body}) async {
//   try {
//     final res = await appClient.post(
//       ApiPath.apiGetCollageFrame,
//       data: body.toJson(),
//     );
//     TemplateEntity? response = TemplateEntity.fromJson(res.data);
//     return response.data?.listData ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
//
// Future<List<Template>> getHomeTemplate() async {
//   try {
//     final res = await appClient.get(ApiPath.apiHomeTemplate);
//     TemplateRes? response = TemplateRes.fromJson(res.data);
//     return response.data ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
//
// Future<List<StickerAndBgr>> getStickerAndBgr() async {
//   try {
//     final res = await appClient.get(ApiPath.apiStickerBackground);
//     StickerAndBgrRes? response = StickerAndBgrRes.fromJson(res.data);
//     return response.data ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
//
// Future<List<BackgroundData>> getBgr() async {
//   try {
//     final res = await appClient.post(ApiPath.apiBackgroundData, data: {});
//     BgrRes? response = BgrRes.fromJson(res.data);
//     return response.data ?? [];
//   } catch (e) {
//     logger.e(e);
//     return [];
//   }
// }
}
