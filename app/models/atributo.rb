class Atributo < ActiveRecord::Base
  belongs_to :producto


  validates :producto, presence: true
  validates :campo, presence: true
  validates :llave, presence: true
end
