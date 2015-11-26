class User < ActiveRecord::Base
  has_secure_password

  has_many :guest_setlists
  has_many :setlists
  has_many :guest_setlists
  has_many :viewable_lists, through: :guest_setlists, source: :setlist, class_name: "Setlist"
  has_many :votes

  validates_presence_of :username
  # This is copied off the interweb. Why are you only validating on create?
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_uniqueness_of :email, :username
end
