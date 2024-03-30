
class ApiMessage {
  ApiMessage({
    required this.message,
  });

  String message;

  factory ApiMessage.fromJson(Map<String, dynamic> json) {

    List<String> message = [];
    var messageMap = json['data']['message'];

    try{
      if(messageMap.containsKey('username')){
        message.addAll(List<String>.from(messageMap['username'].map((x)=>x)));
      }

      if(messageMap.containsKey('password')){
        message.addAll(List<String>.from(messageMap['password'].map((x)=>x)));
      }

      if(messageMap!=null && message.isEmpty){
        message.addAll(List<String>.from(messageMap.map((x)=>x)));
      }

      return ApiMessage(
        message: message.join('\n'),
      );
    }catch(e){
      return ApiMessage(
        message: messageMap.toString(),
      );
    }



  }

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
