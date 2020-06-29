# frozen_string_literal: true

require 'lib/url/base'

module Url
  class ListProductsFromJson < Base
    def list
      products = json_to_hash(read_content)
      products = sort_by_price(products)

      print_each(products)
    end
  end
end
