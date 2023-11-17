class Subscription < ApplicationRecord
    validates :name, :phone, :email, :province, :city, :profile, :agree, presence: true
end
