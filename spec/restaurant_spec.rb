require './lib/restaurant'

RSpec.describe Restaurant do

  before :each do
    @restaurant = Restaurant.new('10:00', 'Fuel Cafe')
    @restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
    @restaurant2 = Restaurant.new('16:00', 'Il Poggio')
  end

  describe '#initialize' do
    it "exists and has attributes" do
      expect(@restaurant).to be_a Restaurant

      expect(@restaurant.opening_time).to be_a String
      expect(@restaurant.opening_time).to eq("10:00")

      expect(@restaurant.name).to be_a String
      expect(@restaurant.name).to eq("Fuel Cafe")

      expect(@restaurant.dishes).to be_a Array
      expect(@restaurant.dishes).to be_empty
    end
  end

  describe '#closing_time(12_hr_time)' do
    it "takes in the number of hours open and adds the number to the opening time" do
      expect(@restaurant1.closing_time(8)).to be_a String

      expect(@restaurant1.closing_time(8)).to eq("18:00")
      expect(@restaurant2.closing_time(7)).to eq("23:00")
    end
  end

  describe '#add_dishes(dish)' do 
    it "can add dishes" do
      restaurant = Restaurant.new('16:00', 'Il Poggio')

      restaurant.add_dish('Burrata')
      restaurant.add_dish('Pizzetta')
      restaurant.add_dish('Ravioli')

      expect(restaurant.dishes.count).to eq 3
      expect(restaurant.dishes).to eq(["Burrata", "Pizzetta", "Ravioli"])
    end
  end

  describe '#open_for_lunch?' do
    it 'if open before 12:00 returns true' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      
      expect(restaurant1.open_for_lunch?).to eq(true)
    end

    it 'if open after 12:00 returns false' do
      restaurant2 = Restaurant.new('16:00', 'Il Posto')

      expect(restaurant2.open_for_lunch?).to eq(false)
    end
  end

  
  describe '#menu_dish_names' do
    it 'opening time > 12 returns dishes in the downcase position' do
      restaurant = Restaurant.new('16:00', 'Il Poggio')

      restaurant.add_dish('Burrata')
      restaurant.add_dish('Pizzetta')
      restaurant.add_dish('Ravioli')

      expect(restaurant.menu_dish_names).to eq(["Burrata", "Pizzetta", "Ravioli"])
    end

    it 'opening time < 12 returns dishes in the upcase position' do
      restaurant = Restaurant.new('10:00', 'Fuel Cafe')

      restaurant.add_dish('Burrata')
      restaurant.add_dish('Pizzetta')
      restaurant.add_dish('Ravioli')

      expect(restaurant.menu_dish_names).to eq(["BURRATA", "PIZZETTA", "RAVIOLI"])
    end
  end

  describe '#announce_closing_time' do
    it 'change the format of the end time to a 12-hr format' do
      restaurant1 = Restaurant.new('6:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Posto')

      expect(restaurant1.announce_closing_time(5)).to be_a String
      expect(restaurant1.announce_closing_time(5)).to eq("Fuel Cafe will be closing at 11:00AM")
      expect(restaurant2.announce_closing_time(7)).to eq("Il Posto will be closing at 11:00PM")
    end
  end

  describe '#format(time)' do
    it 'should format the time into 5-digit format' do
      restaurant = Restaurant.new('6:00', 'Fuel Cafe')
      expect(restaurant.format('6:00')).to eq('06:00')
    end
  end
  
end
