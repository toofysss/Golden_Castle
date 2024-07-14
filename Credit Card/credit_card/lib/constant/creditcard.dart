class CreditCardClass {
  static bool showdietals = true;
  static List post = ["images/post1.jpg", "images/post2.jpg"];
  static List<Map<String, String>> creditcard = [
    {
      "name": "GCC IQ",
      "Num": "2656 3464 4099 5889",
      "exp": "2023/9/15",
      "cvv": "934"
    },
        {
      "name": "GCC IQ MS",
      "Num": "2656 3464 4099 5889",
      "exp": "2023/9/15",
      "cvv": "934"
    },
  ];
  static Future getdata() async {
    return post;
  }

  static Future getcreditcardinformation() async {
    return creditcard;
  }
}
