# frozen_string_literal: true

def stock_picker(prices)
  min_price = prices[0]
  min_price_index = 0
  max_profit = 0
  buy_day = 0
  sell_day = 0

  prices.each_with_index do |price, index|
    if price < min_price
      min_price = price
      min_price_index = index
    elsif price - min_price > max_profit
      max_profit = price - min_price
      buy_day = min_price_index
      sell_day = index
    end
  end

  [buy_day, sell_day]
end

puts stock_picker([17,3,6,9,15,8,6,4,10])

# [17,3,6,9,15,8,6,1,10]
# [1,4]  # for a profit of $15 - $3 == $12