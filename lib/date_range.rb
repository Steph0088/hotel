module Hotel
  class DateRange
    attr_accessor :start_date, :end_date
    
    def initialize(start_date, end_date)
      self.class.validate_date(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end
    
    def self.validate_date(start_date, end_date)
      number_of_days = (end_date - start_date).to_i
      puts number_of_days
      
      if start_date.nil? || end_date.nil?
        raise ArgumentError.new('Invalid no Start and/or End Date given')
      elsif start_date == end_date
        raise ArgumentError.new('Invalid Start and/or End Date')
      elsif number_of_days < 0
        raise ArgumentError.new('Invalid, end date cant be before start date')
      end
    end
    
    #finish this:
    def overlap?(other_range)
      if self.start_date == other_range.start_date && self.end_date == other_range.end_date
        return true
      else
        return false
      end 
    end
    
    def nights
      total_nights = (end_date - start_date).to_i
      return total_nights
    end
  end
end