class BlogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :user_id
  has_many :paragraphs
  has_many :images
end
