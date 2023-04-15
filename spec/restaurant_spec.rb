require './lib/restaurant'

RSpec.describe Restaurant do

  before :each do
    @restaurant = Restaurant.new('10:00', 'Fuel Cafe')
  end

  describe '#initialize' do
    it "exists and has attributes" do
      expect(@restaurant).to be_a Restaurant

      expect(@restaurant.opening_time).to be_a String
      expect(@restaurant.opening_time).to eq("10:00")

      expect(@restaurant.name).to be_a String
      expect(@restaurant.name).to eq("Fuel Cafe")

      expect(restaurant.dishes).to be_a Array
      expect(restaurant.dishes).to be_empty
    end
  end

  describe "Iteration 2" do

    it "has closing time" do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Poggio')

      expect(restaurant1.closing_time(8)).to eq("18:00")
      expect(restaurant2.closing_time(7)).to eq("23:00")
    end

    it "can add dishes" do
      restaurant = Restaurant.new('16:00', 'Il Poggio')
      restaurant.add_dish('Burrata')
      restaurant.add_dish('Pizzetta')
      restaurant.add_dish('Ravioli')

      expect(restaurant.dishes).to eq(['Burrata', 'Pizzetta', 'Ravioli'])

    end

  end

  describe "Iteration 3" do

    it 'is open for lunch' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Posto')
      
      expect(restaurant1.open_for_lunch?).to eq(true)
      expect(restaurant2.open_for_lunch?).to eq(false)
    end

    it 'can add_dish to menu' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Posto')

      restaurant2.add_dish('Burrata')
      restaurant2.add_dish('Pizzetta')
      restaurant2.add_dish('Ravioli')

      expect(restaurant2.menu_dish_names).to eq(["BURRATA", "PIZZETTA", "RAVIOLI"])
    end

  end

  describe "Iteration 4" do

    it 'can announce closing time' do
      restaurant1 = Restaurant.new('6:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Posto')

      expect(restaurant1.announce_closing_time(5)).to eq("Fuel Cafe will be closing at 11:00AM")
      expect(restaurant2.announce_closing_time(7)).to eq("Il Posto will be closing at 11:00PM")
    end

  end
end
