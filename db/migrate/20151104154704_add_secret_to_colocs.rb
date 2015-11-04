class AddSecretToColocs < ActiveRecord::Migration
  def change
    add_column :colocs, :secret, :string
  end
end
