class Event < ApplicationRecord
    
    has_many :attendances
    has_many :users, through: :attendances
    validates :start_date, presence: true
    validate :start
    validates :duration, presence: true
    validate :multiple
    validates :title, length: { minimum: 5 , maximum: 140 }
    validates :description, length: { minimum: 20 , maximum: 1000}
    validates :price, numericality: { greater_than: 1}
    validates :price, numericality: { less_than: 1000}
    validates :location, presence: true
    belongs_to :creator, class_name: "User"
    
    
    end
    
        def start 
            unless  start_date > Time.zone.today
                    start_date.errors[:time] << 'event cannot be in the past'
            end
        end
    
        def multiple
            if (duration%5!= 0)
                errors.add(:duration, message: "duration must be a multiple of 5")
            end
        end
