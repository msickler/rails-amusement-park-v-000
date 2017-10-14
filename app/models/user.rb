class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :name, uniqueness: true


  def mood
    if happiness.present? && nausea.present?
      happiness > nausea ? "happy" : "sad"
    end
  end


end
