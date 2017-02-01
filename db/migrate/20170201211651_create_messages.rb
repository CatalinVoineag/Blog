class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

    	t.text :message
    	t.string :name
    	t.string :email
    	t.boolean :read

      t.timestamps null: false
    end
  end
end
