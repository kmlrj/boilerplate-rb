# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

# Main
module Main
  def self.do
    'Hello, World!'
  end
end

loader.eager_load # optionally
