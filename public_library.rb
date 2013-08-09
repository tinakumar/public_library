class Book
  #methods shelf control where book is sitting
  attr_accessor :title, :author, :location, :status

  def self.create_for(title, author, location, status)
    @books ||= []
    @books << Book.new(title, author, location, status)
  end

  def initialize(title, author, location, status)
    @title = title
    @author = author
    @status = status
    @location = location
  end

  def self.find_for(location)
    # enshelf method - defines book's present location
    @shelf = @books.find{ |book| book.location == "#{location}"}
  end

  def unshelf(title, author)
    #maybe staging area, if book is not in proper location
    while @status == "Available" && @location == "Nil"
      if self.title.start_with?("A", "B", "C", "D", "E", "F", "G")
        location == "ST3"
        "#{book.title} by #{book.author} is located on shelf ST3."
      else
        location == "ST9"
        "#{book.title} by #{book.author} is located on shelf ST9."
      end
    end
  end

end

class Library < Book
  #should be aware of number of shelves
  #method to report all books it contains
  @@shelf_number = 0

  def initialize(shelf, book)
    @library = []
    @shelf = shelf
    @book = book
    @@shelf_number += 1
  end

  def book_inventory
    @books = Book.all
  end
  puts "There are #{books.count} books in this library"

  def number_of_shelves
    @@shelf_number.count
  end
end

class Shelf
  #should know what book it contains
  attr_accessor :shelf_number, :shelf_name

  def book_on_shelf
    @books = Book.all
    location = @books.find{ |book| book.location == "#{location}"}
    "This shelf contains #{book.title} by #{book.author}"
  end
end

#___________________________Testing Area______________________________________

#ruby public_library.rb
#Book.create_for("The Great Gatsby", "F. Scott Fitzgerald", "G1", "Available")
#Book.create_for("The Sun Also Rises", "Ernest Hemingway", "C9", "Available")
#Book.create_for("Othello", "William Shakespeare", "Nil", "Available")
#puts Book.find_for("G1")
#"The Great Gatsby"
#unshelf("Othello", "William Shakespeare")
#"Othello by William Shakespeare is located on shelf ST9."
#puts book_inventory
#("The Great Gatsby", "F. Scott Fitzgerald", "G1", "Available"),("The Sun Also Rises", "Ernest Hemingway", "C9", "Available"), ("Othello", "William Shakespeare", "Nil", "Available")
#"There are 3 books in this library."
