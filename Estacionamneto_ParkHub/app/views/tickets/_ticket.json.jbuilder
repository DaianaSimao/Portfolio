json.extract! ticket, :id, :hora_entrada, :hora_saida, :valor_cobrado, :veiculo_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
