class Atividade < ActiveRecord::Base
  belongs_to :usuario

  validates_presence_of :nome, :descricao

  attr_accessible :descricao, :nome
end
