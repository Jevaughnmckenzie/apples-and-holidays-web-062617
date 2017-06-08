require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  winter = holiday_hash[:winter]
  winter[:christmas] << supply
  winter[:new_years] << supply

  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

#convert to string
#check for underscore
#if string has underscore
  #split with underscore as the delimiter
  #use map to iterate on resulting array, capitalizeng each word
  #use .join(" ") on the result of map
#else
  #use .capitalize on the new string

  holiday_hash.each do |season, holidays|

    puts "#{pretty_convert(season)}:"

    holidays.each do |holiday_key, holiday_supplies|
      string_key = pretty_convert(holiday_key)
      # string_array = holiday_supplies.map { |holiday_supply| pretty_convert(holiday_supply) }
      # string_supplies = string_array.join(", ")
      string_supplies = holiday_supplies.join(", ")
      puts "  #{string_key}: #{string_supplies}"

    end

  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  bbq_holidays = []

  holiday_hash.each do |season, holidays|

    potential_bbq_holiday = holidays.select do |holiday, supplies|

                              supplies.include?("BBQ")

                            end
    if !(potential_bbq_holiday.empty?)

      bbq_holidays << potential_bbq_holiday.keys

    end

  end

  bbq_holidays.flatten

end


def pretty_convert(symbol)

  string_symbol = symbol.to_s
  if string_symbol.include?("_")

    string_array = string_symbol.split("_")
    capitalized_string_array = string_array.map { |word| word.capitalize!  }
    capitalized_string_array.join(" ")
  else
    string_symbol.capitalize!
  end
end
