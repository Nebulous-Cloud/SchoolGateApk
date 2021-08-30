/// This is the object to store all the neccessary details needed for
/// each user. Minimum is the unique id. -- Joel

class AccountUser {
  String uid;
  String? name;
  AccountUser({this.uid = '0', this.name = '0'});
  
  void setUid(String uid) {
    this.uid = uid;
  }

  void setName(String name) {
    this.name = name;
  }

}