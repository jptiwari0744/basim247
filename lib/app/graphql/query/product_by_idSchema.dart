class ProductByIdSchema {
  static String productByIdJson = """
  query(\$id:ID!){
  product(id: \$id) {
		title
		price
		images
		category {
			id
			name
			image
		}
	}
  }
""";
}
