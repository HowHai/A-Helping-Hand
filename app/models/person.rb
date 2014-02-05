class Person
  include Mongoid::Document
  field :name, type: String
  field :age, type: String
  field :location, type: String
  field :description, type: String
  field :photo_url, type: String

  # Relation to User model
  belongs_to :user
end
