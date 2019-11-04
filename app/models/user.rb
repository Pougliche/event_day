class User < ApplicationRecord

    has_many :attendances
    has_many :events, through: :attendance
    has_many :created_events, foreign_key: 'creator_id', class_name: "Event"
    validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please"} 
    validates :encrypted_password, length: { minimum: 6 }, presence: true
    validates :first_name, :last_name, presence:true
    after_create :welcome_send


    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
    
end