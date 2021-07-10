# frozen_string_literal: true

class DeviseCreateLiveHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :live_houses do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :price
      t.string :house_name
      t.string :postal_code
      t.string :address
      t.string :website
      t.float :branches, :latitude
      t.float :branches, :longitude
      t.string :telephone_number
      t.string :image_id
      t.text :detail
      t.boolean :is_active, default: false, null: false

      t.timestamps null: false
    end

    add_index :live_houses, :email,                unique: true
    add_index :live_houses, :reset_password_token, unique: true
    # add_index :live_houses, :confirmation_token,   unique: true
    # add_index :live_houses, :unlock_token,         unique: true
  end
end