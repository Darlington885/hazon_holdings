//
//
// import 'package:local_auth/local_auth.dart';
// import 'package:mobx/mobx.dart';
// import 'package:validators/validators.dart';
//
// part 'register_store.dart';
//
// class RegisterStore = _RegisterStore with _$RegisterStore;
//
// abstract class _RegisterStore with Store {
//   final RegisterErrorStore error = RegisterErrorStore();
//   var localAuth = LocalAuthentication();
//
//   @observable
//   bool loading = false;
//
//
//   @observable
//   String firstName;
//
//   @observable
//   String lastName;
//
//   @observable
//   String dob;
//
//   @observable
//   String gender;
//
//
//   @observable
//   String email;
//
//   @observable
//   String password;
//
//
//
//   @action
//   void load(bool load) {
//     this.loading = load;
//   }
//
//   @action
//   void validateFirstName(String value) {
//     if (isNull(value) || value.isEmpty)
//       error.firstName = 'First Name is required';
//     else
//       error.firstName = null;
//   }
//
//   @action
//   void validateLastName(String value) {
//     if (isNull(value) || value.isEmpty)
//       error.lastName = 'Last Name is required';
//     else
//       error.lastName = null;
//   }
//
//
//
//   @action
//   void validateDob(String value) {
//     if (isNull(value) || value.isEmpty)
//       error.dob ="Date of birth  is required";
//     else
//       error.dob = null;
//   }
//
//   @action
//   void validateGender(String value) {
//     if (isNull(value) || value.isEmpty)
//       error.gender ="Gender is required";
//     else
//       error.gender = null;
//   }
//
//
//   @action
//   void validatePassword(String value) {
//     error.password =
//     isNull(value) || value.isEmpty ? 'Password is required' : null;
//   }
//
//   @action
//   void validateEmail(String value) {
//     if (isNull(value) || value.isEmpty)
//       error.email = 'Email is required';
//     else if (!isEmail(value))
//       error.email = 'Enter a valid email';
//     else
//       error.email = null;
//   }
//
//
//
//
//
//   List<ReactionDisposer> _disposers;
//   void setupValidations() {
//     _disposers = [
//       reaction((_) => firstName, validateFirstName),
//       reaction((_) => lastName, validateLastName),
//       reaction((_) => dob, validateDob),
//       reaction((_) => gender, validateGender),
//       reaction((_) => password, validatePassword),
//       reaction((_) => email, validateEmail)
//     ];
//   }
//
//
//   void dispose() {
//     for (final d in _disposers) {
//       d();
//     }
//   }
//
//   bool get hasErrors {
//
//     validateFirstName(firstName);
//     validateLastName(lastName);
//     validateDob(dob);
//     validateGender(gender);
//     validatePassword(password);
//     return error.hasErrors;
//   }
//
//   bool get hasErrorsEmail {
//     validateEmail(email);
//
//     return error.hasErrorsEmail;
//   }
//
//
// }
//
// class RegisterErrorStore = _RegisterErrorStore with _$RegisterErrorStore;
//
// abstract class _RegisterErrorStore with Store {
//
//
//   @observable
//   String firstName;
//
//   @observable
//   String lastName;
//
//   @observable
//   String dob;
//
//   @observable
//   String gender;
//
//   @observable
//   String password;
//
//   @observable
//   String email;
//
//
//
//   @computed
//   bool get hasErrors => firstName != null || lastName != null || dob != null || gender != null || password != null;
//
//   @computed
//   bool get hasErrorsEmail => email != null;
// }