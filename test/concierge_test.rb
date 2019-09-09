require_relative "test_helper"

describe Hotel::Concierge do
  #What does @concierge do in this test at beginning? I don't understand is it creating a new 
  #Concierge obj
  before do
    @concierge = Hotel::Concierge.new
    @date = Date.parse("2020-08-04")
  end
  describe "Wave 1" do
    describe "rooms" do
      it "returns a list of rooms" do
        rooms = @concierge.rooms
        expect(rooms).must_be_kind_of Array
      end
    end
    describe "reserve_room" do
      it "takes two Date objects and returns a Reservation" do
        start_date = @date
        end_date = start_date + 3
        @reservation = @concierge.reserve_room(start_date, end_date)

        expect(@reservation).must_be_kind_of Hotel::Reservation
      end
    end
    describe "find_reservations" do
      it "takes a Date and returns a list of Reservations" do
        reservation_list = @concierge.find_reservations(@date)

        expect(reservation_list).must_be_kind_of Array
        reservation_list.each do |res|
          res.must_be_kind_of Reservation
        end
      end
    end
  end
  describe "Wave 2" do
    describe "available_rooms" do
      it "takes two dates and returns a list" do
        start_date = @date
        end_date = start_date + 3

        room_list = @concierge.available_rooms(start_date, end_date)
        expect(room_list).must_be_kind_of Array
      end
    end
  end
end
