class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.float      :kt,          null: false
      t.integer    :pulse,       null: false
      t.integer    :systolic,    null: false
      t.integer    :diastolic,   null: false
      t.float      :bw,          null: false
      t.boolean    :palpitation, null: false, default: false
      t.boolean    :suffocation, null: false, default: false
      t.boolean    :swelling,    null: false, default: false
      t.boolean    :fatigue,     null: false, default: false
      t.references :user,        null: false, foreign_key: true
      t.datetime   :start_time,  null: false

      t.timestamps
    end
  end
end
