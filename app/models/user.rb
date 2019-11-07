class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    after_create :welcome_send
    has_many :attendances
    has_many :events, through: :attendances
    has_many :created_events, foreign_key: 'creator_id', class_name: "Event"
    validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please"} 
    validates :encrypted_password, length: { minimum: 6 }, presence: true
    validates :first_name, :last_name, presence:true
    


    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
    
end