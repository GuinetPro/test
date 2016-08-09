class Producto < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :tipovehiculo
  belongs_to :tipoproducto
  belongs_to :aseguradora
  belongs_to :destacado

  has_many :atributo

  has_many :tienevigencias
  has_many :vigencias, through: :tienevigencias

  #validates :precio, presence: true
  validates :url_compra, presence: true
  validates :url_poliza, presence: true
  validates :tipovehiculo, presence: true
  validates :tipoproducto, presence: true
  validates :aseguradora, presence: true
  #validates :destacado, presence: true
  

  #callbacks de los atributos
  after_create :save_atributos
  after_update :save_atributos
  before_update :update_atributos

  #callbacks de las vigencias
  after_create   :save_vigencias
  after_update   :save_vigencias
  before_update  :update_vigencias
  before_destroy :update_vigencias


  #Custom setter de losa tributos
  def pre=(value)
    @pre = value
  end

  def compraAtributo=(value)
    @compraAtributo = value
  end

  def polizaAtributo=(value)
    @polizaAtributo = value
  end

  def tipovehiculoAtributo=(value)
    @tipovehiculoAtributo = value
  end

  def tipoproductoAtributo=(value)
    @tipoproductoAtributo = value
  end

  def aseguradoraAtributo=(value)
    @aseguradoraAtributo = value
  end

  def destacadoAtributo=(value)
    @destacadoAtributo = value
  end

  def vigenciaAtributo=(value)
    @vigenciaAtributo = value
  end

  #Aqui seteamos para guardar muchas vigencias
  def vigencias=(value)
    @vigencias = value
  end

  private

  #Guardamos las vigencias del producto
  
    def save_vigencias
      #raise @tags.to_yaml
      unless @vigencias.nil?
        @vigencias.each do |vigencia_id|
          Tienevigencia.create(producto_id:self.id,vigencia_id:vigencia_id)
        end
      end

    end

    def update_vigencias
      Tienevigencia.destroy_all(:producto_id => self.id)
    end

    
    #Guardamos todos los atributos enviados por campo
    def save_atributos

      unless @pre.nil?
          @pre[:llave].each do |key,value|
            Atributo.create(producto_id:self.id,llave:value,valor:@pre[:valor][key],campo:'precio')
          end
      end

      unless @compraAtributo.nil?
          @compraAtributo[:llave].each do |key,value|
            Atributo.create(producto_id:self.id,llave:value,valor:@compraAtributo[:valor][key],campo:'compra')
          end
      end

      unless @polizaAtributo.nil?
          @polizaAtributo[:llave].each do |key,value|
             Atributo.create(producto_id:self.id,llave:value,valor:@polizaAtributo[:valor][key],campo:'poliza')
          end
      end

      unless @tipovehiculoAtributo.nil?
          @tipovehiculoAtributo[:llave].each do |key,value|
             Atributo.create(producto_id:self.id,llave:value,valor:@tipovehiculoAtributo[:valor][key],campo:'tipovehiculo')
          end
      end

      unless @tipoproductoAtributo.nil?
         @tipoproductoAtributo[:llave].each do |key,value|
            Atributo.create(producto_id:self.id,llave:value,valor:@tipoproductoAtributo[:valor][key],campo:'tipoproducto')
          end 
      end
      
      unless @aseguradoraAtributo.nil?
          @aseguradoraAtributo[:llave].each do |key,value|
             Atributo.create(producto_id:self.id,llave:value,valor:@aseguradoraAtributo[:valor][key],campo:'aseguradora')
          end
      end
      
      unless @destacadoAtributo.nil?
            @destacadoAtributo[:llave].each do |key,value|
              Atributo.create(producto_id:self.id,llave:value,valor:@destacadoAtributo[:valor][key],campo:'destacado')
            end
      end

      unless @vigenciaAtributo.nil?
            @vigenciaAtributo[:llave].each do |key,value|
              Atributo.create(producto_id:self.id,llave:value,valor:@vigenciaAtributo[:valor][key],campo:'vigencia')
            end
      end

    end

    #Al editar eliminamos todos los atributos
    #y volvemos a guardarlos nuevamente por si añadio o elimino alguno
    def update_atributos
      Atributo.destroy_all(:producto_id => self.id)
    end


end
