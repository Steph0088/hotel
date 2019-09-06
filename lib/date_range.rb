module Hotel
  class DateRange
    attr_accessor :start_date, :end_date

    def initialize(start_date, end_date)
      self.class.validate_date(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def self.validate_date(start_date, end_date)
      #check by making sure user enters a start_date and end_date
      #make sure that the end_date is after the start_date

      if start_date.nil? || end_date.nil?
        raise ArgumentError, 'Invalid no Start and/or End Date given'
      elsif start_date == end_date
        raise ArgumentError, 'Invalid Start and/or End Date'
      end
  end
  
    def overlap?(other)

    #How can I use nights in this method? Should I use methods. 
    #Will check if it is one day after start day or one day before end_date.
    
      return false
    end

    def include?(date)
      #In this method you are going to check to see if a specific date is included in the range.
      #you might want to change the name of this method...depending on the purpose of include? in the 
      #other scenario it is used in.

      #you have a date range for each reservation. Now you just need to figure out how to check if a date 
      #is in that range. Think about what is the purpose of this method versus overlap???



      return false
    end

    def nights
      #get the start date and end date of a reservation from date range for a particular reservation
      #subtract the end date from the start date 
      #return an integer of nights
      check_in = reservation.date_range(start_date)
      check_out = reservation.date_range(end_date)
      total_nights = check_out - check_in
    end
    return total_nights
  end
end
