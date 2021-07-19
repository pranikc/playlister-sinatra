class Genre < ActiveRecord::Base 
    has_many :song_genres
    has_many :songs, through: :song_genres  
    has_many :artists, through: :songs 

    def slug
        array = self.name.split
        new_array = array.map {|word| word.downcase}
        new_array.join("-")
    end

    def self.find_by_slug(slug)
        self.all.find{ |artist| artist.slug == slug}
    end
end
