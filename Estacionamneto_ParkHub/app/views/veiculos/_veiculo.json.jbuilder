json.extract! veiculo, :id, :placa, :marca, :modelo, :cor, :tipo, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
