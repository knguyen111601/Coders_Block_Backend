class Blog < ApplicationRecord
  belongs_to :user
  has_many :paragraphs, dependent: :destroy
  has_many :images, dependent: :destroy
end
