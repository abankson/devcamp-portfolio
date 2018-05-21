module Placeholder
  extend ActiveSupport::Concern

  def self.imageGenerator(height:,width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end
end