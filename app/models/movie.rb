# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:title, {:presence => true})
  validates(:year, {:presence => true})
  validates(:duration, {:presence => true})
  validates(:director_id, {:presence => true})
  validates(:description, {:presence => true})
  validates(:image, {:presence => true})

  has_many(:characters, { :class_name => "Character", :foreign_key => "movie_id", :dependent => :destroy })
  
  belongs_to(:director, { :required => true, :class_name => "Director", :foreign_key => "director_id" })

  has_many(:cast, { :through => :characters, :source => :actor })
end
