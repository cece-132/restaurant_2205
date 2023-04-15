require 'pry'

class Restaurant
    attr_reader :dishes, :name, :opening_time, :closed, :closing_announce_time
    def initialize(opening_time, name)
      @name = name
      @opening_time = opening_time
      @dishes = []
      # @closed = closed
      @closing_announce_time = closing_announce_time
    end

    def closing_time(hours)
      minutes = @opening_time[3..4]
      hour = @opening_time[0..1].to_i
      "#{(hour + hours).to_s}:#{minutes}"
    end

    def add_dish(dish)
      @dishes << dish
    end

    def open_for_lunch?
      if opening_time.to_i < 12
       true
      else
       false
      end
    end

    def menu_dish_names
      menu = []
      @dishes.each do |dish|
        menu << dish.upcase
      end
      menu
    end

    def announce_closing_time(hours)
      time = @opening_time.to_i + hours
      if time > 24
        new_int = @closed - 24
        binding.pry
        if new_int > 12
          @closing_announce_time = "#{new_int - 12}:00PM"
          "#{@name} will be closing at #{closing_announce_time}"
        else
           @closing_announce_time = "#{new_int}:00AM"
           "#{@name} will be closing at #{closing_announce_time}"
        end
      elsif time >= 12
        @closing_announce_time = "#{time - 12}:00PM"
        "#{@name} will be closing at #{closing_announce_time}"
      else
        @closing_announce_time = "#{time}:00AM"
        "#{@name} will be closing at #{closing_announce_time}"
      end
    end

end