class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :nome
      t.text :descricao
      t.references :usuario

      t.timestamps
    end
    add_index :atividades, :usuario_id
  end
end
