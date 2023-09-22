


import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {}

abstract class _LoginStore with Store {
  final LoginErrorStore error = LoginErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  bool passwordVisible = true;

  @observable
  String password = '';

  @action
  void load(bool load) {
    this.loading = load;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Password is required' : null;
  }


  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => password, validatePassword)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    validatePassword(password);

    return error.hasErrors;
  }

}

class LoginErrorStore = _LoginErrorStore with _$LoginErrorStore;

abstract class _LoginErrorStore with Store {

  @observable
  String password;

  @computed
  bool get hasErrors => password != null;
}