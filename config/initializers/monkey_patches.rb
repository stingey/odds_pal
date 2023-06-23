# frozen_string_literal: true

module JSON
  def self.parse(source, opts = {})
    Parser.new(source, **opts).parse
  end
end
