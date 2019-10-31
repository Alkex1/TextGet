class TextbooksSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :textbook
end
