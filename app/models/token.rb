class Token < ActiveRecord::Base
  belongs_to :my_app

  before_create :generate_token

  private

  def generate_token
  	begin
  		self.token = SecureRandom.hex
  	end while Token.where(token: self.token).any?
  	self.experies_at = 2.years.from_now
  end

end
