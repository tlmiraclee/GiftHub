class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :question, null: false
      t.string :value, null: false
    end
  end
end
