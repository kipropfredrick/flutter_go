enum LocalStorage{
token,
login,
userId,
email,
userName,
userobject,
uid
}
extension LocalStorageGetDat on LocalStorage{
  String get key{
    switch (this) {
      case LocalStorage.token:
      return "token";
      case LocalStorage.login:
      return "login";
      case LocalStorage.userId:
      return "userId";
      case LocalStorage.userName:
      return "userName";
     case LocalStorage.email:
     return "_email";
     case LocalStorage.userobject:
     return "userobject";
       case LocalStorage.uid:
     return "_uid";
    }
  }
  
}