class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :username, :uniqueness => true

  has_many(
    :contacts,
    :class_name => "Contact",
    :primary_key => :id,
    :foreign_key => :user_id
  )
  has_many(
  :contact_shares,
  :class_name => "ContactShare",
  :primary_key => :id,
  :foreign_key => :user_id)

  has_many :shared_contacts,
  :through => :contact_shares,
  :source => :contact

end
