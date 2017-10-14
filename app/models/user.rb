class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood 
    if happiness.present?
      happiness > nausea ? "happy" : "sad" 
    end 
  end
end
