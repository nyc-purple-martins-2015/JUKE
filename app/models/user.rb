class User < ActiveRecord::Base
  has_secure_password

  has_many :guest_setlists
  has_many :setlists
  has_many :guest_setlists
  has_many :viewable_lists, through: :guest_setlists, source: :setlist, class_name: "Setlist"

end
