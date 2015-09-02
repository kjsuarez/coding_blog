class AddAssociationsToAdmins < ActiveRecord::Migration
  def change
  	add_reference :posts, :admin, index: true
    add_foreign_key :posts, :admin
  end
end
