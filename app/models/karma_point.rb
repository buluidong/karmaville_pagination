class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  before_save :get_value
  after_save :update

  def get_value
  	if id
  		@before_change = KarmaPoint.find(self.id).value
  	else
  		@before_change = 0
  	end
  end

  def update
  	self.user.update
  end

end
