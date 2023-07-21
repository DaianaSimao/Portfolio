class Vaga < ApplicationRecord
  
  def status_display
    status ? 'Ocupada' : 'Disponível'
  end
end
