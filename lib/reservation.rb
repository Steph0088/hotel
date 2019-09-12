module Hotel
  class Reservation
    attr_reader :date_range, :room
    
    #I don't need to have start and end date in initialize becuase that would be bad design. 
    #start and end dates are already saved in date-range. 
    def initialize(start_date, end_date, room)
      @date_range = DateRange.new(start_date, end_date)
      @room = room
    end

    def cost
     total_cost = date_range.nights * 200
      return total_cost
    end
  end
end
