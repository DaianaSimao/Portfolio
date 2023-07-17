class Checkin < ApplicationRecord
  belongs_to :veiculo
  belongs_to :preco
  belongs_to :vaga

end