class AddUserToDatabase < ActiveRecord::Migration
  def change
    User.create(email: 'admin@akp.nl', password: 'AKP2015', admin: true)
  end
end
