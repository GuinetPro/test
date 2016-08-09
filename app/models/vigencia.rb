class Vigencia < ActiveRecord::Base
  belongs_to :tipovigencia
  belongs_to :campana

  has_many :tienevigencias
  has_many :productos, through: :tienevigencias

  validates :fecha_desde, presence: true
  validates :fecha_hasta, presence: true

  
  validates :tipovigencia, presence: true
  validates :campana, presence: true

end
