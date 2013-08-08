class Book < ActiveRecord::Base
  attr_accessible :title, :author, :available, :shelf_id

  belongs_to :shelf
  belongs_to :library

  def enshelf
    #gives book's present location
    location = self.shelf_id
  end

  def unshelf
    #maybe staging area, if book is not in proper location
    if self.title.start_with?("A", "B", "C", "D", "E", "F", "G")
      location == "ST3"
    else
      location == "ST9"
    end
  end
end

class Library < ActiveRecord::Base

  has_many :shelves
  has_many :books

  def book_inventory
    @books = Book.all
  end

  def number_of_shelves
    @shelf = Shelf.all.count
  end
end

class Shelf < ActiveRecord::Base

  has many :books
  belongs_to :library

end
