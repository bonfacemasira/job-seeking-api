class User < ApplicationRecord
 

  devise :database_authenticatable, :registerable,
           :validatable
  validates :username, presence: true, uniqueness: true

  before_create :set_default_role

  before_save { |user| user.username = user.username.downcase }
  
  enum role: [:admin, :job_seeker, :employer] 
  after_initialize :set_default_role, :if => :new_record?
  

  def set_default_role
   self.role ||= :admin
  end
  
end



