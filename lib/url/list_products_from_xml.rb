# frozen_string_literal: true

require 'lib/url/base'

module Url
  class ListProductsFromXml < Base
    def list
      raw_nodes = xml_to_hash(read_content)
      products = raw_nodes.dig('rss', 'channel', 'item')
      products = sort_by_price(products)

      print_each(products)
    end
  end
end
