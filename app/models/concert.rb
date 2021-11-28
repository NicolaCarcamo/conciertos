class Concert < ApplicationRecord
  belongs_to :group

  validates :date, presence: true
  validates :attendee, presence: true
end
