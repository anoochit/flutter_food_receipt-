String readAllRecipts = """
query {
  receipts {
    data {
      id
      attributes {
        name
        description
        images {
          data {
            attributes {
              url
            }
          }
        }
        ingredients {
          id
          name
        }
      }
    }
  }
}
""";
