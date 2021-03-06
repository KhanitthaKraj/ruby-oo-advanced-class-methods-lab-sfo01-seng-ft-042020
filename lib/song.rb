require 'pry'

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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_name_array = file_name.sub!(/.mp3/,'').split(" - ")
    song = self.new
    song.name = file_name_array[1]
    song.artist_name = file_name_array[0]
    song
  end

  def self.create_from_filename(file_name)
    file_name_array = file_name.sub!(/.mp3/,'').split(" - ")
    song = self.new
    song.name = file_name_array[1]
    song.artist_name = file_name_array[0]
    song.save
    song
  end

  def self.destroy_all
      self.all.clear
  end

end
