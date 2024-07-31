require_relative "list"
require_relative "share"

class Shop
  include List
  include Share
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end