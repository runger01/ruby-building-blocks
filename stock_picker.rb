def stock_picker(stock_prices)
    stock_prices_ascending = stock_prices.sort
    p stock_prices_ascending
end

stock_prices = [17,3,6,9,15,8,6,1,10]
stock_picker(stock_prices)