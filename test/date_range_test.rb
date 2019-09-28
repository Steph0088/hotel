require_relative "test_helper"

describe Hotel::DateRange do
  describe "Constructor" do
    it "Can be initialized with two dates" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      range = Hotel::DateRange.new(start_date, end_date)
      expect(range.start_date).must_equal start_date
      expect(range.end_date).must_equal end_date
    end
 
    it "is an an error for negative-length ranges" do
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2016,01,01)
      expect { Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError
    end
    
    it "is an error to create a 0-length range" do
      start_date = Date.new(2017, 01, 01)
      end_date = Date.new(2017, 01, 01)
      expect {Hotel::DateRange.new(start_date, end_date)}.must_raise ArgumentError
    end
  end
  
  describe "overlap?" do
    before do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      @range = Hotel::DateRange.new(start_date, end_date)
    end
    
    it "returns true for the same range" do
      start_date = @range.start_date
      end_date = @range.end_date
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal true
    end

    it "returns false for range starting on the end_date date" do
      start_date = @range.end_date
      end_date = start_date + 2 
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal false
    end


#This test is not working fix it.!!! Not sure if it works at this point.
    it "returns true for a range that overlaps with start date inside" do
      start_date = @range.start_date + 1
      #changed the > sign to less than becuase I want start date in w/in the range
      expect(start_date).must_be < @range.end_date
      end_date = @range.end_date + 3
      expect(end_date).must_be > @range.end_date
      # I don't know if I need tests range here : do I if it was created in before statement
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal true
    end

    #Test that I added to check end date inside range
    it "returns true for a range that overlaps with the end date inside" do
      start_date = @range.start_date - 1
      expect(start_date).must_be < @range.start_date
      end_date = @range.end_date - 1
      expect(end_date).must_be < @range.end_date
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal true
    end
    
    xit "returns false for a range ending on the start_date date" do
      start_date = @range.start_date - 3
      expect(start_date).must_be < @range.start_date
      end_date = @range.start_date
      expect(end_date).must_equal @range.start_date
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal false
    end
    
    xit "returns false for a range completely before" do
      start_date = @range.start_date - 7
      end_date = @range.start_date - 5
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal false
    end
    
    xit "returns false for a date completely after" do
      start_date = @range.end_date + 10
      end_date = @range.end_date + 15
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.overlap?(test_range)).must_equal false
    end
  end
  
  xdescribe "include?" do

    xit "returns true for a contained range" do
      start_date = @range.start_date
      end_date = @range.end_date
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.include?(test_range.start_date)).must_equal true
      expect(@range.include?(test_range.end_date)).must_equal true
    end

    xit "returns true for a range that overlaps after @range start_date " do
      start_date = Date.new(2017,12,28)
      end_date = Date.new(2017,01, 02)
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.include?(test_range.end_date)).must_equal true
    end
    
    xit "returns true for a range that overlaps in the back" do
      start_date = Date.new(2017 ,12 ,28)
      end_date = Date.new(2017,03 ,02)
      test_range = Hotel::DateRange.new(start_date, end_date)
      expect(@range.include?(test_range.start_date)).must_equal true
    end

    it "returns false if the date is clearly out" do
    end
    
    it "returns true for dates in the range" do
    end
    
    it "returns false for the end_date date" do
    end
  end
  
  xdescribe "nights" do
    start_date = Date.new(2017, 01, 01)
    end_date = start_date + 3
    @range = Hotel::DateRange.new(start_date, end_date)
    
    it "returns the correct number of nights" do
      expect(@range.end_date - @range.start_date).must_equal 3
    end
  end
end
