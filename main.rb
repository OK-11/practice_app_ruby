require_relative "main/shop"
require_relative "main/goods"
require_relative "main/customer"

#まずお店をつくる
shop = Shop.new("shopA")
shop.have_wallet
#次にメニューを持つ
goods = [
  #(ID,名前,価格,個数)
  Goods.new(1,"リンゴ",100,10),
  Goods.new(2,"メロン",500,10),
  Goods.new(3,"イチゴ",300,10),
  Goods.new(4,"スイカ",600,10),
  Goods.new(5,"ミカン",50,10)
]
shop.have_list(goods)



#お客さんを設定する
puts "🤖 あなたの名前を教えてください"
name = gets.chomp
customer = Customer.new(name)
#お客さんに財布を持たせる
puts "🏧 ウォレットにチャージする金額を入力してください"
balance = gets.chomp.to_i
customer.have_wallet(balance)
#買い物かごを持たせる
customer.have_list

#ショッピングを開始する
puts "🛍️ ショッピングを開始します"
while true
  puts "📜 商品リスト
+--------+------------------+-----+----+
|商品番号|商品名            |金額 |数量|
+--------+------------------+-----+----+"
  shop.show_list


  puts "️⛏ 商品番号を入力してください"
  id = gets.chomp.to_i
  puts "️⛏ 商品数量を入力してください"
  number = gets.chomp.to_i

  buy_goods = shop.list.find do |goods|
    goods.id == id
  end
  copy = buy_goods.dup

  customer.add_list(copy,number)
  puts "🛒 カートの中身
+--------+------+-----+----+
|商品番号|商品名            |金額 |数量|
+--------+------+-----+----+"
  customer.show_list
  customer.set_total
  puts "🤑 合計金額: #{customer.total}"

  shop.set_list(id,number)
  puts "😭 買い物を終了しますか？(yes/no)"
  anser = gets.chomp
  if anser=="yes"
    break
  end
end

puts "୨୧┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈結果┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈୨୧"
puts "🛍️ #{customer.name}様の所有物"
puts "+--------+------+-----+----+
|商品番号|商品名            |金額 |数量|
+--------+------+-----+----+"
customer.show_list
puts "🌚 合計金額: #{customer.total}"
puts "😱👛 #{customer.name}様のウォレット残高: #{customer.wallet.balance - customer.total}"
puts "📦 #{shop.name}の在庫状況"
puts "+--------+------+-----+----+
|商品番号|商品名            |金額 |数量|
+--------+------+-----+----+"
shop.show_list
puts "😻👛 #{shop.name}のウォレット残高: #{shop.wallet.balance + customer.total}"
puts "有難うございました"






























