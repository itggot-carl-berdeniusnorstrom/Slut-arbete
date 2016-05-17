class Acount
  include DataMapper::Resource

  property :id, Serial
  property :mail, String, required: true
  property :username, String, required: true
  property :fullname, String, required: true
  property :date, Serial, required: true
  property :password, BCryptHash, required: true


  has n, :profiles

end