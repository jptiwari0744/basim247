class ProductByCategorySchema {
  static String productByCatJson = """
    query (\$categoryId: Float) {
      products(categoryId: \$categoryId) {
        title
        price
        images
        id
      }
    }
  """;
}
