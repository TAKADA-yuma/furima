class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false, default:""
      t.integer :price,           null: false
      t.string :nickname,         null: false, default:""
      t.text  :text,              null: false
      t.references :user,         null: false
      t.timestamps
    end
  end
end
