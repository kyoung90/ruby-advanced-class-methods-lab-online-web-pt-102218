require ("pry")
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    @@all << song
    return song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    return song
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song 
    return song
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if (song.name == name)
        return song
      end 
    end 
    return false
  end 
  
  def self.find_or_create_by_name(name)
    # found = self.find_by_name(name)
    # if found
    #   return found
    # end 
    # self.create_by_name(name)
    return self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song = self.create
    song.artist_name = file[0]
    song.name = file[1][0..-5]
    return song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song 
    return song
  end 
  
  def self.destroy_all
    @@all.clear
  end 
end
