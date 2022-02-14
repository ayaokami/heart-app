class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string     :title,     null: false
      t.text       :text,      null: false
      t.integer    :genre_id,  null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
