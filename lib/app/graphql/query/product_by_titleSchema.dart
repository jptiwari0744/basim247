class ProductByTitleSchema {
  static String productByTitleJson = """
  
  query(\$title:String){
  products(title:\$title){
   title
    price
    images
    id
  }
  }
  
  """;
}
