class Person
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  # Need for paperclip
  def self.after_commit(*args, &block)
    args.each do |arg|
    case arg[:on]
      when :destroy
        after_destroy &block
      end
    end
  end

  field :name, type: String
  field :age, type: String
  field :location, type: String
  field :description, type: String
  field :photo_url, type: String
  field :created_at, type: Date, default: Time.now

  # has_mongoid_attached_file :image,
  # :styles => {
  #   :thumb => "100x100#",   # Centrally cropped
  #   :small  => "200x200>",  # Only squish if it's larger than this
  #   :elongate => "20x500"
  # }

  has_mongoid_attached_file :image,
  :styles => {
  :original => '1920x1680>',
  :thumbnail => '40x40#',
  :small => '100x100#',
  :medium => '300x300',
  :thumbnail_2x => '80x80#',
  :small_2x => '200x200#',
  :medium_2x => '600x600'
  },

  convert_options: {
    all: '-background white -flatten +matte'
  }

  # Relation to User model
  belongs_to :user

  # Need for paperclip
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

  # Redefine #to_json


end
