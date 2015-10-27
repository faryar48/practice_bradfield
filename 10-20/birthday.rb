require 'date'

birthdays = {
  '07/14': ['Frank', 'George'],
  '04/08': ['Faryar'],
  '10/25': ['Myles'],
}


def take_birthday_list_and_turn_into_day_of_the_year(birthday_string)
  month = (birthday_string[0..1]).to_i
  day = (birthday_string[3..4]).to_i
  year = Time.new.year
  date = Date.new(year, month, day)
  date_in_days = date.yday
end


def find_friends_birthdays_in_the_next_30_days(birthday_list)
  current_time = Time.new
  current_day_of_the_year = current_time.yday

  names_list = []
  birthday_list.each do |birthday_string, name_list|
    birthday_day_of_the_year = take_birthday_list_and_turn_into_day_of_the_year(birthday_string)
    birthday_days_in_the_future = birthday_day_of_the_year - current_day_of_the_year
    names_list.push(name_list) if (birthday_days_in_the_future < 30 && birthday_days_in_the_future > 0)
  end
  return names_list.flatten
end

p find_friends_birthdays_in_the_next_30_days(birthdays)