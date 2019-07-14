class CreateTokenAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :token_auths do |t|
      t.integer   :user_id
      t.string    :authentication_token
      t.datetime  :expired

      t.timestamps
    end

    add_index :token_auths, :authentication_token, :unique => true
  end
end
