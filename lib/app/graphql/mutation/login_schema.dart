class LoginSchema {
  static String loginJson = """
  mutation (\$email:String!,\$password:String!){
  
	login(email:\$email, password:\$password) {
		access_token
		refresh_token
	}
}

  """;
}