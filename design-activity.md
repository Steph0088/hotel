
-What classes does each implementation include? Are the lists the same?
  
  Each implementation has the exact same classes and the lists are exactly the same, but each one uses the classes completely differently. 

-Write down a sentence to describe each class?

  Implementation A:

  Class CartEntry: Allows you to set and get each cart entry price and entry quantity with an accessor method.

  Class ShoppingCart: Lets you get and set shopping cart list into an array.

  Class Order: It calculates total price of shopping cart by creating a Shopping Cart object and setting it to @cart instance variable.

  Implementation B:

  Class CartEntry: It initializes passed in unit price and quantity and then has a method to calculate the price for that cart entry.

  Class ShoppingCart: It initializes a shopping cart with an array of entries and has a method to calculate total cost for the shopping cart by calling on price method for each entry from class CartEntry.

  Class Order: Initializes @cart with a ShoppingCart object  with has total price for shopping and adds in sales tax with the total price method. 

-How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

  Implementation A:

  In this implementation class Order depends on ShoppingCart Class to retrieve an array of product entries. Upon initialization Class Order instantiates a Shopping Cart object to get the shopping cart and stores them in @cart. To calculate total price it loops through ShoppingCart array and calls on each entries for it's price and quantity which is available for each cart entry from Class CartEntry. 
  
  Implementation B:
  
  Unlike the first implementation each cart entries price is calculated in Class CartEntry. Then ShoppingCart class holds an array of entries and calculates price for the entire Shopping cart. Lastly, order creates an instance of ShoppingCart class and calculates the total price by adding on tax. 

-What data does each class store? How (if at all) does this differ between the two implementations?

  Implementation A:

  class CartEntry: It stores unit price and quantity of an entry.

  class ShoppingCart: Stores and array of entries.

  Class Order: calculates total price and includes taxes, but doesn't store anything. 

  Implementation B:

  Class CartEntry: It stores unit_price and quantity for each entry. 

  Class ShoppingCart: It stores and array of entries.

  Class Order: it doesn't store anything it calculates total price to include sales tax. 

  Comparing both:
  They don't differ in their storage of data. They pretty much store the same type of information in each class.They differ in the way they depend on each-other for different things.

-Consider the Order#total_price method. In each implementation: Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

  Implementation A: It is retained in Order. In this implementation the total_price method does everything. 

  Implementation B: In this implementation is delated to lower classes and it just calculates the sales Tax in the method. 

-Does total_price directly manipulate the instance variables of other classes?

  In implementation A it does manipulate the instance variables of other classes because it goes through each and every since entry and calls for the unit price and quantity and multiplies them together. In implementation B it simply calls on Shopping cart for the price and adds on the sales Tax. It never touches any of the other classes instance variables.

-If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

  You would have to change the class CartEntry to include this feature, but it would be really hard to change it in Implementation A because you would have to also change the order Class and not just CartEntry Class.

-Which implementation better adheres to the single responsibility principle?

  Implementation B, better adheres the single responsibility principle because each class is responsible for exactly one thing. 

-Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?


Hotel Project:
For each class in your program, ask yourself the following questions:
  
  What is this class's responsibility?
  You should be able to describe it in a single sentence.
  Is this class responsible for exactly one thing?
  Does this class take on any responsibility that should be delegated to "lower level" classes?
  Is there code in other classes that directly manipulates this class's instance variables?



  DateRange: creates a date range given a start date and end-date and validates it, it also checks for overlap, and calculates total number of nights stayed. 

  Reservation: using DateRange object it tally's the cost for a particular room. 

  Concierge: Is in charge of making reservations for the first available given DateRange.

  