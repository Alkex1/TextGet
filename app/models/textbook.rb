class Textbook < ApplicationRecord
  belongs_to :user
  has_many :textbooks_subjects
  has_many :subjects, through: :textbooks_subjects
  has_one_attached :picture
end
