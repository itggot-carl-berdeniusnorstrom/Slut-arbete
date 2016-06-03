class Profile
  include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true
    property :picture, FilePath, default: '/grillkorv.png'

  belongs_to :acount
  has n, :list, :through => Resource

end