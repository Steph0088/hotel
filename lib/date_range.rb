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
    
    def overlap?(other)
    if (start_date <=> end_date) == (other)
      return true
    elsif end_date == other.start_date
      return false
    elsif start_date == other.end_date
      return false
    elsif (start_date <=> end_date).inlude?(other.start_date)
      return true
    elsif (start_date <=> end_date).include?(other.end_date)
      return true
    end
  end

    #I don't think I even need this method. Do I?
    #Confusing becuase include is a method and I use it in concierge?
    def include?(date)
     range = (start_date..end_date)
    if range.include?(date)
      return true
    end
  end 

    def nights
      total_nights = (end_date - start_date).to_i
      return total_nights
    end
  end
end