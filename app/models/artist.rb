class Artist < ActiveRecord::Base 
    has_many :songs 
    has_many :genres, through: :songs 

    def slug
        array = self.name.split
        new_array = array.map {|word| word.downcase}
        new_array.join("-")
    end

    def self.find_by_slug(slug)
        self.all.find{ |artist| artist.slug == slug}
    end

end

