class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, limit: 128
      t.string :genre, limit: 32
      t.text :description
      t.string :isbn, limit: 13
      t.datetime :publish_date
      t.timestamps # created_at / updated_at
    end
  end
end
