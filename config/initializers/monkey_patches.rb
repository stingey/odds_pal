# frozen_string_literal: true

module JSON
  def self.parse(source, opts = {})
    debugger
    Parser.new(source, **opts).parse
  end
end
