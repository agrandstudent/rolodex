class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, :presence => true

  belongs_to(
    :owner,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :user_id
  )
  has_many(
  :contact_shares,
  :class_name => "ContactShare",
  :primary_key => :id,
  :foreign_key => :contact_id)

  has_many :shared_users,
  :through => :contact_shares,
  :source => :user

  def self.contacts_for_user_id(user_id)
    query = <<-SQL
    SELECT
      contacts.*
    FROM
      contacts
    LEFT OUTER JOIN
      contact_shares
    ON
      contacts.id = contact_shares.contact_id
    WHERE
      contact_shares.user_id = ? OR contacts.user_id = ?
    SQL
    self.find_by_sql([query, user_id, user_id])
  end

  def self.favorite_contacts_for_id(user_id)
    query = <<-SQL
    SELECT
      contacts.*
    FROM
      contacts
    LEFT OUTER JOIN
      contact_shares
    ON
      contacts.id = contact_shares.contact_id
    WHERE
      contact_shares.user_id = ? AND contact_shares.favorite = "t"
    SQL
     self.find_by_sql([query, user_id])
  end
end