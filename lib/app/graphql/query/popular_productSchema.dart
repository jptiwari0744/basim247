class popular_ProductSchema {
  static String productJson = """
{
  products(limit: 10, offset: 0){
    title
    price
    images
    
  }
}
""";
}
