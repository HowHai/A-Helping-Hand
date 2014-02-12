class Person
  include Mongoid::Document
  include Mongoid::Paperclip

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
  has_mongoid_attached_file :image

  # Relation to User model
  belongs_to :user

  # Need for paperclip
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
