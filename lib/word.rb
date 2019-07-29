~/require './lib/definition'
class Word
  attr_accessor :id, :word, :definition
    @@words = {}
    @@total_rows = 0

  def initialize (word, id, definition)
    @name = name
    @id = id || @@ total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Words.new(self.word, self.id, self.definition)
  end

  def == (album_to_compare)
    self.word() == album_to_compare.name()
  end

  def self.find(id)
    @@words[id]
  end

  def update(word, id, definition)
    self.word = word
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
