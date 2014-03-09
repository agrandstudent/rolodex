require 'addressable/uri'
require 'rest-client'
require 'json'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/5/contacts'
  #query_values: {'data' => "stuff", 'subdata[key]' => 'more stuff'}
  # { 'data' => 'stuff', 'subdata' => { 'key' =>'more stuff' }}
).to_s

puts RestClient.get(url)

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { :user => {  :email => "gizmo@gizmo.gizmo"} }
  )
end

def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s

  puts RestClient.post(
    url,
    { :contact => { :name => "gizmo", :email => "gizmo@gizmo.gizmo", :user_id => 5} }
  )
end

 #create_contact


#puts RestClient.delete(url)