class Subject < ApplicationRecord
    has_many :textbooks_subjects
    has_many :textbooks, through: :textbooks_subjects
end
