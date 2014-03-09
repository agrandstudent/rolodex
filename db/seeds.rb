u1 = User.create(:username => "Billy")
u2 = User.create(:username => "Bob")
u3 = User.create(:username => "Jacky")
u4 = User.create(:username => "Jim")

c1 = Contact.create(:name => "Billy",:email => "stuff", :user_id => u1.id)
c2 = Contact.create(:name => "Bob",:email => "stuff_as_well", :user_id => u2.id)
c3 = Contact.create(:name => "Jacky",:email => "stuff@you.com", :user_id => u3.id)
c4 = Contact.create(:name => "Jim",:email => "this_stuff", :user_id => u4.id)

ContactShare.create(:user_id => u1.id,:contact_id => c2.id )
ContactShare.create(:user_id => u1.id,:contact_id => c3.id, :favorite => true)
ContactShare.create(:user_id => u1.id,:contact_id => c4.id )
ContactShare.create(:user_id => u1.id,:contact_id => 1 , :favorite => true)

