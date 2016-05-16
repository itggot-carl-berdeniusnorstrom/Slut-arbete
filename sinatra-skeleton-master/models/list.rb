class List
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true

  has(n, :profiles, :through => Resource)
  has(n, :contents)

end