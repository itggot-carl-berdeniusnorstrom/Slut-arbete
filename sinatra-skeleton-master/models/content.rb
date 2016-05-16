class Content

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :amount, Integer

  belongs_to :list

end