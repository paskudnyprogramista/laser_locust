# frozen_string_literal: true

module Logs
  # TODO: Refactor whole code
  class ListMostRequestedFiles
    IMG_FILE_REGEX = /([0-9A-Za-z_ ]+(.[jJ][pP][gG]|.[gG][iI][fF]))/.freeze
    HOSTNAME_REGEX = %r{(https?://(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?://(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})}.freeze

    TEST = /(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)+([A-Za-z]|[A-Za-z][A-Za-z0-9\-]*[A-Za-z0-9])/.freeze

    class << self
      def list(file_path)
        xml_file = URI.open(file_path).readlines

        images_struct = Struct.new(:image, :tail)
        hostname_struct = Struct.new(:hostname, :tail)

        xml_file.each do |line|
          image = line.match(IMG_FILE_REGEX) { |m| images_struct.new(*m.captures) }
          hostname = line.match(HOSTNAME_REGEX) { |m| hostname_struct.new(*m.captures) }

          p image
          p hostname
        end
      end
    end
  end
end
