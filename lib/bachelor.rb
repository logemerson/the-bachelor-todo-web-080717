require "pry"

def get_first_name_of_season_winner(data, season)
  data.each do |seas_num, seas_data|
    if season == seas_num
      seas_data.each do |contestant|
        if contestant["status"] == "Winner"
          return contestant["name"].split[0]
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |seas_num, seas_data|
    seas_data.each do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |seas_num, seas_data|
    seas_data.each do |contestant|
      if contestant["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |seas_num, seas_data|
    seas_data.each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages = []

  data.each do |seas_num, seas_data|
    if seas_num == season
      seas_data.each do |contestant|
        ages << contestant["age"].to_f
      end
    end
  end
  sum = 0
  ages.each { |age| (sum += age).to_f}
  avg_float = (sum / ages.count)
  if (avg_float % 1.0) >= 0.5
    return avg_float.to_i + 1
  else
    return avg_float.to_i
  end
end
