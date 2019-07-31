require './lib/definition'
class Word
  attr_accessor :id, :name
    @@words = {}
    @@total_rows = 0

  def initialize (name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def == (word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(name, id)
    self.name = name
    self.id = id
  end

  def delete
    @@words.delete(self.id)
  end

  def self.search(search_term)
    @@words.select{|key, value| value.name =~/#{search_term}/}.values
  end
  def definitions
    Definition.find_by_word(self.id)
  end
end
