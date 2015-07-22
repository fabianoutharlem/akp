class AddUserToDatabase < ActiveRecord::Migration
  def change
    User.create(email: 'admin@akp.nl', password: 'Welkom#1', admin: true)
  end
end
