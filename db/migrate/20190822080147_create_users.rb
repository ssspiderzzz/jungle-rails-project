class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # Schema: User(name:string, password_digest:string, recovery_password_digest:string)
      t.string :name
      t.string :password_digest
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
