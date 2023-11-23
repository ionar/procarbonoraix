class Resgate < ApplicationRecord
    validates :nome, :phone, :email, :chave, :cpfcnpj, :agree, :privacidade, presence: true
end
