# frozen_string_literal: true

require 'open-uri'
require 'oj'
require 'active_support/core_ext'

module Url
  class Base
    def initialize(url)
      @url = url
    end

    # TODO: Move to READER
    def read_content
      open_url.read
    end

    # TODO: Move to CONVERTER
    def xml_to_hash(content)
      Hash.from_xml(content)
    end

    # TODO: Move to CONVERTER
    def json_to_hash(content)
      Oj.load(content)
    end

    # TODO: Move to SORTER
    def sort_by_price(products)
      products.sort_by { |product| product['price'].to_i }
    end

    def print_each(products)
      products.each do |product|
        data = { title: product['title'], description: product['description'], price: product['price'] }

        p data
      end
    end

    private

    def open_url
      URI.open(@url)
    end
  end
end
