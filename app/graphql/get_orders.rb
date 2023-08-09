class GetOrders
  include ShopifyGraphql::Query

  QUERY = <<~GRAPHQL
    query {
      orders(first: 10) {
        edges {
          node {
            id
            name
            totalPrice
            displayFinancialStatus
            displayFulfillmentStatus
          }
        }
      }
    }
  GRAPHQL

  def call
    response = execute(QUERY)
    response.data = response.data.orders.edges.map(&:node)
    response
  end
end
