json.extract! resgate, :id, :nome, :email, :phone, :chave, :cpfcnpj, :agree, :privacidade, :created_at, :updated_at
json.url resgate_url(resgate, format: :json)
