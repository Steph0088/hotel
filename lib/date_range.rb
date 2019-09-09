module Hotel
  class DateRange
    attr_accessor :start_date, :end_date
    
    def initialize(start_date, end_date)
      puts "I am in intilialize"
      self.class.validate_date(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      
    end
    
    def self.validate_date(start_date, end_date)
      puts "i am in validate"
      puts start_date
      puts end_date
      
      number_of_days = (end_date - start_date).to_i
      puts number_of_days
      
      #check by making sure user enters a start_date and end_date
      #make sure that the end_date is after the start_date
      #Making sure that their is no negative date range
      if start_date.nil? || end_date.nil?
        raise ArgumentError.new('Invalid no Start and/or End Date given')
      elsif start_date == end_date
        raise ArgumentError.new('Invalid Start and/or End Date')
      elsif number_of_days < 0
        raise ArgumentError.new('Invalid, end date cant be before start date')
      end
    end
    
    def overlap?(other)
    if (start_date..end_date) == (other.start_date..other.end_date)
      return true
    elsif end_date == other.start_date
      return false
    elsif start_date == other.end_date
      return false
    end
  end


   if @reservation.date_range
      compare_to = other
      @reservations.each do |reservation|
        if reservation.start_date == compare_to.start_date && 
          reservations.end_date == compare_to.end_date
        end
      end
      return "Conflict"
    end
    
    #I don't think I even need this method.
    def include?(date)
     range = (start_date..end_date)
    if range.include?(date)
      return true
    end
  end 

    def nights
      total_nights = (end_date - start_date)
      return total_nights
    end
  end
end