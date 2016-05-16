class Acount
  include DataMapper::Resource

  property :id, Serial
  property :mail, String, required: true
  property :password, BCryptHash, required: true


  has n, :profiles

end