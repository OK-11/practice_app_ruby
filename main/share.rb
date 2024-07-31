require_relative "wallet"

module Share
  attr_accessor :total , :wallet
  def have_wallet(balance=0)
    @wallet = Wallet.new(balance)
  end

  def set_total
    @total = 0
    @list.each do |goods|
      @total =@total + goods.price * goods.number
    end
  end
end