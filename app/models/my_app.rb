class MyApp < ActiveRecord::Base

  belongs_to :usuario
  has_many :tokenes

  before_create :generate_app_id
  before_create :generate_secret_key

  validates :titulo, presence:true
  validates :usuario, presence:true
  validates :secret_key, uniqueness:true
  validates :app_id, uniqueness:true

  def is_tu_token?(token)
    self.tokenes.where(tokenes: { id: token.id })
  end

  private

  def generate_app_id
  	begin
  		self.app_id = SecureRandom.hex
  	end while MyApp.where(app_id: self.app_id).any?
  end

  def generate_secret_key
   	begin
  		self.secret_key = SecureRandom.hex
  	end while MyApp.where(secret_key: self.secret_key).any? 	
  end
  
end
