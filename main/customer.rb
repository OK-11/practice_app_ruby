require_relative "share"
require_relative "list"

class Customer
  include Share
  include List
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end