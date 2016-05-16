class Seeder

  def self.seed!
    listprofile
  end

  def self.listprofile
    pe = Profile.create(name: 'banan')
    lt = List.create(name: 'bsdf')
    ListProfile.create(profile: pe, list: lt)


  end


end