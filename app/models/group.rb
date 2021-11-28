class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy

    validates :name, presence: true
    validates :member, presence: true
    validates :debutdate, presence: true
    validates :type, presence: true

    self.inheritance_column = :_type_disabled

    def to_s
        name
    end

    def totalconcerts
        concerts.count
    end

    def totalattendees
        concerts.sum(:attendee)
    end

    def lastmonth
        concerts.where('date > ? AND date < ?', Date.today.beginning_of_month, Date.today).count
    end
    
    def lastconcert
        concerts.pluck(:date).max.strftime("%Y-%B-%A")
    end

    def maxattendees
        concerts.pluck(:attendee).max
    end

    def maxlength
        concerts.pluck(:duration).max
    end

end
