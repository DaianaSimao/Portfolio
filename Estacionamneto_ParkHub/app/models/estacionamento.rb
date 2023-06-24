class Estacionamento < ApplicationRecord
  belongs_to :veiculo
  belongs_to :vaga
  belongs_to :preco

  has_many :veiculo
  has_many :preco
  has_many :vaga
  has_one :tickets

  after_create :criar_ticket

  def encerrar_estacionamento
    self.ticket ||= Ticket.new
    self.ticket.hora_entrada = @estacionamento.created_at
    self.ticket.hora_saida = Time.current

    self.ticket.save
  end
  
  def self.dados_estacionamento
    sql_query = <<-SQL
      SELECT e.id, v.tipo, v.placa, v.marca, v.modelo, v.cor, vg.andar, vg.numero_vaga, p.preco_hora
      FROM estacionamentos e
      JOIN veiculos v ON e.veiculo_id = v.id
      JOIN vagas vg ON e.vaga_id = vg.id
      JOIN precos p ON e.preco_id = p.id
    SQL

    find_by_sql(sql_query)
  end

  private

  def criar_ticket
    self.create_ticket(hora_entrada: Time.current)
  end
end
