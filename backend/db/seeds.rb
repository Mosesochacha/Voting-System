require 'faker'
puts "Seeding started..."

# Create National
national = National.create(name: "Kenya")

# Create Counties
counties = [
  { name: "Mombasa", region: "Coast", area: 212.5, population: 939_370, capital: "Mombasa", code: "001" },
  { name: "Kwale", region: "Coast", area: 8_270.3, population: 649_931, capital: "Kwale", code: "002" },
  { name: "Kilifi", region: "Coast", area: 12_245.9, population: 1_109_735, capital: "Kilifi", code: "003" },
  { name: "Tana River", region: "Coast", area: 35_375.8, population: 240_075, capital: "Hola", code: "004" },
  { name: "Lamu", region: "Coast", area: 6_497.7, population: 191_539, capital: "Lamu", code: "005" },
  { name: "Taita–Taveta", region: "Coast", area: 17_083.9, population: 284_657, capital: "Wundanyi", code: "006" },
  { name: "Garissa", region: "North Eastern", area: 45_720.2, population: 623_060, capital: "Garissa", code: "007" },
  { name: "Wajir", region: "North Eastern", area: 55_840.6, population: 661_941, capital: "Wajir", code: "008" },
  { name: "Mandera", region: "North Eastern", area: 25_797.7, population: 1_025_756, capital: "Mandera", code: "009" },
  { name: "Marsabit", region: "Eastern", area: 66_923.1, population: 291_166, capital: "Marsabit", code: "010" },
  { name: "Isiolo", region: "Eastern", area: 25_336.1, population: 143_294, capital: "Isiolo", code: "011" },
  { name: "Meru", region: "Eastern", area: 7_003.1, population: 1_356_301, capital: "Meru", code: "012" },
  { name: "Tharaka-Nithi", region: "Eastern", area: 2_609.5, population: 365_330, capital: "Kathwana", code: "013" },
  { name: "Embu", region: "Eastern", area: 2_555.9, population: 516_212, capital: "Embu", code: "014" },
  { name: "Kitui", region: "Eastern", area: 24_385.1, population: 1_012_709, capital: "Kitui", code: "015" },
  { name: "Machakos", region: "Eastern", area: 5_952.9, population: 1_098_584, capital: "Machakos", code: "016" },
  { name: "Makueni", region: "Eastern", area: 8_008.9, population: 884_527, capital: "Wote", code: "017" },
  { name: "Nyandarua", region: "Central", area: 3_107.7, population: 596_268, capital: "Ol Kalou", code: "018" },
  { name: "Nyeri", region: "Central", area: 2_361.0, population: 693_558, capital: "Nyeri", code: "019" },
  { name: "Kirinyaga", region: "Central", area: 1_205.4, population: 528_054, capital: "Kerugoya", code: "020" },
  { name: "Murang'a", region: "Central", area: 2_325.8, population: 942_581, capital: "Murang'a", code: "021" },
  { name: "Kiambu", region: "Central", area: 2_449.2, population: 1_623_282, capital: "Kiambu", code: "022" },
  { name: "Turkana", region: "Rift Valley", area: 98_597.8, population: 1_100_399, capital: "Lodwar", code: "023" },
  { name: "West Pokot", region: "Rift Valley", area: 8_418.2, population: 512_690, capital: "Kapenguria", code: "024" },
  { name: "Samburu", region: "Rift Valley", area: 20_182.5, population: 223_947, capital: "Maralal", code: "025" },
  { name: "Trans-Nzoia", region: "Rift Valley", area: 2_469.9, population: 818_757, capital: "Kitale", code: "026" },
  { name: "Uasin Gishu", region: "Rift Valley", area: 2_955.3, population: 894_179, capital: "Eldoret", code: "027" },
  { name: "Elgeyo-Marakwet", region: "Rift Valley", area: 3_049.7, population: 369_998, capital: "Iten", code: "028" },
  { name: "Nandi", region: "Rift Valley", area: 2_884.5, population: 752_965, capital: "Kapsabet", code: "029" },
  { name: "Baringo", region: "Rift Valley", area: 11_075.3, population: 555_561, capital: "Kabarnet", code: "030" },
  { name: "Laikipia", region: "Rift Valley", area: 8_696.1, population: 399_227, capital: "Rumuruti", code: "031" },
  { name: "Nakuru", region: "Rift Valley", area: 7_509.5, population: 1_603_325, capital: "Nakuru", code: "032" },
  { name: "Narok", region: "Rift Valley", area: 17_921.2, population: 850_920, capital: "Narok", code: "033" },
  { name: "Kajiado", region: "Rift Valley", area: 21_292.7, population: 687_312, capital: "Kajiado", code: "034" },
  { name: "Kericho", region: "Rift Valley", area: 2_454.5, population: 752_396, capital: "Kericho", code: "035" },
  { name: "Bomet", region: "Rift Valley", area: 1_997.9, population: 730_129, capital: "Bomet", code: "036" },
  { name: "Kakamega", region: "Western", area: 3_033.8, population: 1_660_651, capital: "Kakamega", code: "037" },
  { name: "Vihiga", region: "Western", area: 531.3, population: 554_622, capital: "Mbale", code: "038" },
  { name: "Bungoma", region: "Western", area: 2_206.9, population: 1_375_063, capital: "Bungoma", code: "039" },
  { name: "Busia", region: "Western", area: 1_628.4, population: 743_946, capital: "Busia", code: "040" },
  { name: "Siaya", region: "Nyanza", area: 2_496.1, population: 842_304, capital: "Siaya", code: "041" },
  { name: "Kisumu", region: "Nyanza", area: 2_009.5, population: 968_909, capital: "Kisumu", code: "042" },
  { name: "Homa Bay", region: "Nyanza", area: 3_154.7, population: 963_794, capital: "Homa Bay", code: "043" },
  { name: "Migori", region: "Nyanza", area: 2_586.4, population: 917_170, capital: "Migori", code: "044" },
  { name: "Kisii", region: "Nyanza", area: 1_317.9, population: 1_152_282, capital: "Kisii", code: "045" },
  { name: "Nyamira", region: "Nyanza", area: 912.5, population: 598_252, capital: "Nyamira", code: "046" },
  { name: "Nairobi", region: "Nairobi", area: 694.9, population: 3_138_369, capital: "Nairobi", code: "047" }
]

counties.each do |county|
  county_record = County.create(name: county[:name], region: county[:region], area: county[:area], population: county[:population], capital: county[:capital], code: county[:code], national: national)
  
  # Create Subcounties
  subcounties = [
    { name: "#{county_record.name} Subcounty 1", county: county_record },
    { name: "#{county_record.name} Subcounty 2", county: county_record },
    { name: "#{county_record.name} Subcounty 3", county: county_record },
    { name: "#{county_record.name} Subcounty 4", county: county_record },
    { name: "#{county_record.name} Subcounty 5", county: county_record },
    { name: "#{county_record.name} Subcounty 6", county: county_record }
  ]
  
  subcounties.each do |subcounty|
    subcounty_record = Subcounty.create(name: subcounty[:name], county: subcounty[:county])
    
    # Create Wards
    7.times do |i|
      ward_name = "#{subcounty_record.name} Ward #{i + 1}"
      Ward.create(name: ward_name, subcounty: subcounty_record)
    end
  end
end

# Create positions
positions = [
  { name: "President" },
  { name: "Governor" },
  { name: "Senator" },
  { name: "Women Representative" },
  { name: "Member of Parliament" },
  { name: "Member of County Assembly" }
]
positions.each { |position| Position.create(position) }

# Create parties
parties = [
  { name: "Party A", abbreviation: "PA", symbol_name: "symbol_a.jpg" },
  { name: "Party B", abbreviation: "PB", symbol_name: "symbol_b.jpg" },
  # Add more parties as needed
]
parties.each { |party| Party.create(party) }

# Create users
users = [
  { name: "Admin", email: "admin@example.com", password: "password" },
  # Add more users as needed
]
users.each { |user| User.create(user) }

# Create voters using Faker
20.times do
  voter = Voter.new(
    full_names: Faker::Name.name,
    sex: Faker::Gender.binary_type,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    county: County.all.sample.name,
    subcounty: Subcounty.all.sample.name,
    location: Faker::Address.street_address,
    ward: Ward.all.sample
  )
  voter.save!
end

# Create candidates using Faker
30.times do
  candidate = Candidate.new(
    name: Faker::Name.name,
    education: Faker::Educator.degree,
    integrity: Faker::Lorem.paragraph,
    image: Faker::Avatar.image,
    kenyan_citizen: true,
    age: Faker::Number.between(from: 25, to: 65),
    meets_educational_requirements: true,
    meets_integrity_requirements: true,
    nominated_by_party: true,
    nominated_by_signatures: false,
    meets_support_requirements: true,
    manifesto: Faker::Lorem.paragraph,
    party: Party.all.sample,
    position: Position.all.sample,
    ward: Ward.all.sample
  )
  candidate.save!
end

puts "Seeding completed successfully."
