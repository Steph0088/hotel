module Hotel
  class Concierge
    attr_reader :rooms
    
    # Wave 1
    def initialize(rooms = (1..20).to_a)
      @rooms = rooms
      @reservations = []
    end 
    
    def reserve_room(start_date, end_date)
      rooms = available_rooms(start_date, end_date)
      if rooms.empty?
        raise StandardError.new "No rooms available #{start_date} through #{end_date} "
      end
      res = Reservation.new(start_date, end_date, rooms.first)
      @reservations << res
      # start_date and end_date should be instances of Date
      return res
    end
    
    def find_reservations(date)
      specific_date_reservations = []
      #this method will return all reservations that are schedule on this date.
      #so visualize a method that will have date = res and room , res and room , res and room , res and room
      #loop through reservations array and find the ones that have the matching date.
      # go to reservations and call on date range when looping through array if date matches date range then
      #you would add that reservation to an array of rooms reserved on that day. 
      reservations.each do |reservation|
        if reservation.date_range.include?(date)
          specific_date_reservations << reservation
        end
      return specific_date_reservations
    end
    
    # Wave 2
    def available_rooms(start_date, end_date)
      conflicting = []
      reservations.each do |reservation| 
        if reservation.date_range.overlap?(DateRange.new(start_date, end_date)) 
          conflicting << reservation.room
        end
      end
      open_rooms = []
      rooms.each do |room|
        unless conflicting.include?(room)
          open_rooms << room
        end
      end
      return open_rooms
    end
  end
  
  #What will be the purpose of the Concierge class?
  #Will it be to add the trips that were reserved to rooms. 
  