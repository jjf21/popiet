class MonthlyRating < ApplicationRecord
  belongs_to :place
  validates_uniqueness_of :place_id, scope: :month_number
end
