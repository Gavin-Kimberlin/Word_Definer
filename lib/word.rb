~/require './lib/definition'
class Word
  attr_accessor :id, :name, :definition
    @@words = {}
    @@total_rows = 0

  def initialize (name, id, definition)
    @name = name
    @id = id || @@ total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Words.new(self.name, self.id, self.definition)
  end

  def == (album_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(name, id, definition)
    self.name = name
    self.id = id
    self.definition = definition
  end

  def delete
    @@words.delete(self.id)
  end

  def self.search(search_term)
    @@albums.select{|key, value| value.name =~/#{search_term}/}.values
  end
  def definitions
    Definition.find_by_word(self.id)
  end
end
