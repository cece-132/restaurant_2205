require 'pry'

class Restaurant
    attr_reader :dishes, :name, :opening_time, :closed, :closing_announce_time
    def initialize(opening_time, name)
      @name = name
      @opening_time = format(opening_time)
      @dishes = []
    end

    def format(time)
      if time.length == 5
        time
      else
        if time[0..1].to_i < 10
          hours = time[0..1].to_i.to_s.rjust(2, '0')
          "#{hours}:#{time[-2..-1]}"
        end
      end
    end

    def closing_time(hours)
      minutes = @opening_time[-2..-1]
      hour = @opening_time[0..1].to_i
      "#{(hour + hours).to_s}:#{minutes}"
    end

    def add_dish(dish)
      @dishes << dish
    end

    def open_for_lunch?
      if opening_time[0..1] < '12'
       true
      else
       false
      end
    end

    def menu_dish_names
      if @opening_time[0..1] < '12'
        @dishes.map { |dish| dish.upcase }
      elsif @opening_time[0..1] > '12'
        @dishes
      end
    end

    def announce_closing_time(hours)
      minutes = closing_time(hours)[-2..-1]
      hour = closing_time(hours)[0..1].to_i
      if hour < 12
        "#{@name} will be closing at #{closing_time(hours)}AM"
      elsif hour > 12
        hour = hour - 12
        "#{@name} will be closing at #{hour}:#{minutes}PM"
      end
    end

end