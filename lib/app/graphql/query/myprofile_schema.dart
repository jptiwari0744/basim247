class MyProfileSchema {
  static String myProfileJson = """
  query {
  user(id: 1){
		id
		name
		avatar
		email
		password
  }
}
  """;
}
