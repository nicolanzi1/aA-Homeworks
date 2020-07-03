def my_uniq(array)
    uniq_array = []

    array.each do |el|
        uniq_array << el unless uniq_array.include?(el)
    end

    uniq_array
end

def two_sum(array)
    pairs = []

    array.count.times do |i|
        (i + 1).upto(array.count - 1) do |j|
            pairs << [i, j] if array[i] + array[j] == 0
        end
    end

    pairs
end

def my_transpose(rows)
    dimension = rows.first.count
    cols = Array.new(dimension) { Array.new(dimension) }

    dimension.times do |i|
        dimension.times do |j|
            cols[j][i] = rows[i][j]
        end
    end

    cols
end

def pick_stocks(prices)
    best_pair = nil
    best_profit = 0

    prices.each_index do |buy_day|
        prices.each_index do |sell_day|
            next if sell_day < buy_day

            profit = prices[sell_day] - prices[buy_day]
            if profit > best_profit
                best_pair, best_profit = [buy_day, sell_day], profit
            end
        end
    end

    best_pair
end