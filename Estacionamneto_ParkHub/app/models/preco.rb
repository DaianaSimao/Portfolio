class Preco < ApplicationRecord
  validates :tipo, presence: true
  validates :preco_hora, presence: true
end
