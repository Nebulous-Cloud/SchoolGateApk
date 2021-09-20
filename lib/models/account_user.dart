/// This object stores all the information of
/// users that are logged in. This is the parent account.

class AccountUser {
  String uid;
  String name;
  AccountUser({this.uid = '0', this.name = '0'});
  
  // Hi team, what is the use of this? -- Marcus
  // todo: please clean this up if it is not needed or called.
  void setUid(String uid) {
    this.uid = uid;
  }

  // Not used? -- Joel
  void setName(String name) {
    this.name = name;
  }

}