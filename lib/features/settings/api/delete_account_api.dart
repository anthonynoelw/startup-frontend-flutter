import '../../../core/network/api.dart';

class DeleteAccountApi {
  Future<void> deleteAccount() async {
    await apiDelete('user/account');
  }
}
