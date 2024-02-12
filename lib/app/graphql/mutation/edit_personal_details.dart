class EditPersonalDetails {
  static String editPersonalInfoJson = """
  mutation(\$name:String,\$email:String,\$password:String){
	updateUser(id: 1, changes: { name:\$name ,email:\$email,password:\$password}) {
		id
		name
    email
		avatar
    password
	}
}
  """;
}
