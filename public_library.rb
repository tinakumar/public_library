class Book < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :author, :available, :shelf_id

  belongs_to :shelf
  belongs_to :library

  def enshelf
    #gives book's present location
    return self.shelf_id
  end

  def unshelf
    #maybe staging area, if book is not in proper location
    if self.title.start_with?("A", "B", "C", "D", "E", "F", "G")
      return self.title.capitalize + "is located at staging shelf A3."
    else
      return self.title.capitalize + "is located at staging shelf A9."
    end
  end
end

class Library < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :shelves
  has_many :books

  def book_inventory
    @@books = Book.all
  end

  def number_of_shelves
    @@shelf = Shelf.all.count
  end
end

class Shelf < ActiveRecord::Base
  # attr_accessible :title, :body
  has many :books
  belongs_to :library

end
