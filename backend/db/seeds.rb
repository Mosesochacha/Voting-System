require "faker"
puts "Seeding started..."

# Create National
national = National.create(name: "Kenya")

# Create Counties
counties = [
  # { name: "Mombasa", region: "Coast", area: 212.5, population: 939_370, capital: "Mombasa", code: "001" },
  # { name: "Kwale", region: "Coast", area: 8_270.3, population: 649_931, capital: "Kwale", code: "002" },
  # { name: "Kilifi", region: "Coast", area: 12_245.9, population: 1_109_735, capital: "Kilifi", code: "003" },
  # { name: "Tana River", region: "Coast", area: 35_375.8, population: 240_075, capital: "Hola", code: "004" },
  # { name: "Lamu", region: "Coast", area: 6_497.7, population: 191_539, capital: "Lamu", code: "005" },
  # { name: "Taita–Taveta", region: "Coast", area: 17_083.9, population: 284_657, capital: "Wundanyi", code: "006" },
  # { name: "Garissa", region: "North Eastern", area: 45_720.2, population: 623_060, capital: "Garissa", code: "007" },
  # { name: "Wajir", region: "North Eastern", area: 55_840.6, population: 661_941, capital: "Wajir", code: "008" },
  # { name: "Mandera", region: "North Eastern", area: 25_797.7, population: 1_025_756, capital: "Mandera", code: "009" },
  # { name: "Marsabit", region: "Eastern", area: 66_923.1, population: 291_166, capital: "Marsabit", code: "010" },
  # { name: "Isiolo", region: "Eastern", area: 25_336.1, population: 143_294, capital: "Isiolo", code: "011" },
  # { name: "Meru", region: "Eastern", area: 7_003.1, population: 1_356_301, capital: "Meru", code: "012" },
  # { name: "Tharaka-Nithi", region: "Eastern", area: 2_609.5, population: 365_330, capital: "Kathwana", code: "013" },
  # { name: "Embu", region: "Eastern", area: 2_555.9, population: 516_212, capital: "Embu", code: "014" },
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
  { name: "Nairobi", region: "Nairobi", area: 694.9, population: 3_138_369, capital: "Nairobi", code: "047" },
]

counties.each do |county|
  county_record = County.create(name: county[:name], region: county[:region], area: county[:area], population: county[:population], capital: county[:capital], code: county[:code], national: national)

  # Create Subcounties
  subcounties = [
    { name: "#{county_record.name} Subcounty 1", county: county_record },
    { name: "#{county_record.name} Subcounty 2", county: county_record },
    { name: "#{county_record.name} Subcounty 3", county: county_record },
  # { name: "#{county_record.name} Subcounty 4", county: county_record },
  # { name: "#{county_record.name} Subcounty 5", county: county_record },
  # { name: "#{county_record.name} Subcounty 6", county: county_record }
  ]

  subcounties.each do |subcounty|
    subcounty_record = Subcounty.create(name: subcounty[:name], county: subcounty[:county])

    # Create Wards
    2.times do |i|
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
  { name: "Member of County Assembly" },
]
positions.each { |position| Position.create(position) }


# Create parties
parties = [
  # { name: "National Rainbow Coalition-Kenya", code: "001", abbreviation: "NARCKENYA", symbol_name: "Rose Flower" },
  # { name: "The National Vision Party", code: "002", abbreviation: "NVP", symbol_name: "Light House" },
  # { name: "Labour Party of Kenya", code: "003", abbreviation: "LPK", symbol_name: "Star" },
  # { name: "Mwangaza Tu Party", code: "005", abbreviation: "MTP", symbol_name: "House" },
  # { name: "Party of Independent candidate of Kenya", code: "007", abbreviation: "PICK", symbol_name: "Child being lifted by both hands" },
  # { name: "Devolution Empowerment Party", code: "008", abbreviation: "DEP", symbol_name: "Bus" },
  # { name: "Kenya National Congress", code: "009", abbreviation: "KNC", symbol_name: "Key" },
  # { name: "Mazingira Green Party", code: "010", abbreviation: "MGP", symbol_name: "Tree" },
  # { name: "National Democratic Movement", code: "011", abbreviation: "NDM", symbol_name: "Sunflower" },
  # { name: "Wiper- Democratic Movement", code: "012", abbreviation: "WDM", symbol_name: "Umbrella" },
  # { name: "Democratic Party of Kenya", code: "013", abbreviation: "DP", symbol_name: "Lantern" },
  # { name: "Party Of National Unity", code: "014", abbreviation: "PNU", symbol_name: "Two torches with flames" },
  # { name: "United Democratic Alliance", code: "015", abbreviation: "UDA", symbol_name: "Wheelbarrow" },
  # { name: "Agano Party", code: "017", abbreviation: "AP", symbol_name: "Lamb" },
  # { name: "Kenya Social Congress", code: "019", abbreviation: "KSC", symbol_name: "Dove" },
  # { name: "Orange Democratic Movement", code: "021", abbreviation: "ODM", symbol_name: "Ripe Orange" },
  # { name: "People's Party of Kenya", code: "022", abbreviation: "PPK", symbol_name: "Microphone" },
  # { name: "Forum for Restoration of Democracy-Kenya", code: "023", abbreviation: "FORDKENYA", symbol_name: "Lion" },
  # { name: "Progressive Party of Kenya", code: "025", abbreviation: "PPOK", symbol_name: "Battery Torch" },
  # { name: "Jubilee Party", code: "027", abbreviation: "JP", symbol_name: "Two hands holding in unison" },
  # { name: "Maendeleo Democratic Party", code: "028", abbreviation: "MDP", symbol_name: "Scissors" },
  # { name: "National Rainbow Coalition", code: "029", abbreviation: "NARC", symbol_name: "Traditional African Torch (Mwenge)" },
  # { name: "Kenya African Democratic Union-Asili", code: "030", abbreviation: "KADU-ASILI", symbol_name: "Coconut Tree" },
  # { name: "Kenya Patriots Party", code: "031", abbreviation: "KPP", symbol_name: "Wheel" },
  # { name: "Communist Party of Kenya", code: "032", abbreviation: "CPK", symbol_name: "Hammer crossed with a sickle" },
  # { name: "Kenya African National Union", code: "033", abbreviation: "KANU", symbol_name: "Cockerel" },
  # { name: "Safina Party", code: "034", abbreviation: "SAFINA", symbol_name: "Ark carrying animals and people" },
  # { name: "Chama Cha Uzalendo", code: "036", abbreviation: "CCU", symbol_name: "Security Whistle" },
  # { name: "National Agenda Party of Kenya", code: "037", abbreviation: "NAP-K", symbol_name: "A teacher pointing at a blackboard with the Party Name" },
  # { name: "People's Empowerment Party", code: "038", abbreviation: "PEP", symbol_name: "Elephant" },
  # { name: "Peoples Democratic Party", code: "039", abbreviation: "PDP", symbol_name: "Traditional African Banjo" },
  # { name: "The New Democrats", code: "040", abbreviation: "ND", symbol_name: "Bridge" },
  # { name: "United Democratic Movement", code: "041", abbreviation: "UDM", symbol_name: "Milk Can" },
  # { name: "Shirikisho Party Of Kenya", code: "042", abbreviation: "SPK", symbol_name: "Shark" },
  # { name: "Party of Democratic Unity", code: "044", abbreviation: "PDU", symbol_name: "Drum" },
  # { name: "Umoja na Maendeleo Party", code: "045", abbreviation: "UMP", symbol_name: "Factory" },
  # { name: "United Party of Independent Alliance (UPIA)", code: "046", abbreviation: "UPIA", symbol_name: "Antelope" },
  # { name: "Farmers Party", code: "047", abbreviation: "FP", symbol_name: "Maize Plant" },
  # { name: "Economic Freedom Party", code: "048", abbreviation: "EFP", symbol_name: "Acacia Tree" },
  # { name: "Federal Party of Kenya", code: "049", abbreviation: "FPK", symbol_name: "Fist" },
  # { name: "Muungano Party", code: "050", abbreviation: "MP", symbol_name: "Interlocked rings" },
  # { name: "National Party of Kenya", code: "051", abbreviation: "NPK", symbol_name: "Open Book" },
  # { name: "Jirani Mzalendo Asili Party of Kenya", code: "052", abbreviation: "J-MAPK", symbol_name: "Red Shoe" },
  # { name: "Chama Cha Mashinani", code: "054", abbreviation: "CCM", symbol_name: "Golden Yellow Trumpet" },
  # { name: "Alliance for Real Change", code: "055", abbreviation: "ARK", symbol_name: "Aeroplane with the Party Name" },
  # { name: "Forum For Republican Democracy", code: "056", abbreviation: "FORD", symbol_name: "Two raised fingers inside the Kenyan Map" },
  # { name: "Republican Liberty Party", code: "058", abbreviation: "RLP", symbol_name: "Horse" },
  # { name: "Roots Party of Kenya", code: "059", abbreviation: "RPK", symbol_name: "Tree and Roots" },
  # { name: "Ubuntu People's Forum", code: "061", abbreviation: "UPF", symbol_name: "Double thumbs up" },
  # { name: "Amani National Congress", code: "062", abbreviation: "ANC", symbol_name: "Two Branches of Olive Tree" },
  # { name: "Devolution Party of Kenya", code: "063", abbreviation: "DPK", symbol_name: "Tap with running water" },
  # { name: "United Democratic Party", code: "064", abbreviation: "UDP", symbol_name: "Shield" },
  # { name: "Kenya Reforms Party", code: "065", abbreviation: "KRP", symbol_name: "Mechanical gear and shaft, two leaves and two spears" },
  # { name: "People's Trust Party", code: "066", abbreviation: "PTP", symbol_name: "Arrow" },
  # { name: "Maendeleo Chap Chap", code: "067", abbreviation: "MCCP", symbol_name: "Road" },
  # { name: "Democratic Congress", code: "068", abbreviation: "DC", symbol_name: "Butterfly" },
  # { name: "Liberal Democratic Party", code: "069", abbreviation: "LDP", symbol_name: "Satellite Dish" },
  # { name: "Green Congress of Kenya", code: "070", abbreviation: "GCK", symbol_name: "Five Green Trees" },
  # { name: "National Liberal Party", code: "071", abbreviation: "NLP", symbol_name: "Giraffe" },
  # { name: "Movement for Democracy and Growth", code: "072", abbreviation: "MDG", symbol_name: "Three fresh maize cobs in their safety husks" },
  # { name: "Alternative Leadership Party Of Kenya", code: "073", abbreviation: "ALP-K", symbol_name: "Burning Candle with an orange flame" },
  # { name: "Ukweli Party", code: "074", abbreviation: "UP", symbol_name: "U-shaped green plant" },
  # { name: "Empowerment and Liberation Party", code: "075", abbreviation: "ELP", symbol_name: "Ring with people holding hands in unison" },
  # { name: "Third Way Alliance Kenya", code: "076", abbreviation: "TAKE", symbol_name: "Camel in Desert" },
  # { name: "Justice and Freedom Party of Kenya", code: "077", abbreviation: "JFP", symbol_name: "Stretched out hand holding freedom torch" },
  # { name: "Grand Dream Development Party", code: "078", abbreviation: "GDDP", symbol_name: "Sack labelled GDDP Dreams" },
  # { name: "United Green Movement", code: "079", abbreviation: "UGM", symbol_name: "Unity of purpose against an olive-green background" },
  # { name: "Usawa Kwa Wote (formerly Civic Renewal Party)", code: "080", abbreviation: "UKW", symbol_name: "A cow and milking can" },
  # { name: "United Progressive Alliance", code: "081", abbreviation: "UPA", symbol_name: "Two-wheeler motorcycle, captioned in a circular frame" },
  # { name: "The Service Party", code: "082", abbreviation: "TSP", symbol_name: "Heart shape inscribed inside a circle" },
  # { name: "National Ordinary People Empowerment Union", code: "083", abbreviation: "NOPEU", symbol_name: "Ladder" },
  # { name: "National Reconstruction Alliance", code: "084", abbreviation: "NRA", symbol_name: "Hand with a seedling plant and a hand shovel" },
  # { name: "Independent Party", code: "085", abbreviation: "INDP", symbol_name: "Flying Dove" },
  # { name: "Amani Mabadiliko na Demokrasia (formerly Tanzania Labour Party)", code: "086", abbreviation: "AMAD", symbol_name: "Fish" },
  # { name: "Kenya National Union", code: "087", abbreviation: "KENU", symbol_name: "A bell, a hand with a pen, and two wheat stalks" },
  # { name: "Mamlaka Chap Chap Party", code: "088", abbreviation: "MCPP", symbol_name: "Two jigsaw puzzle pieces" },
  # { name: "Saba Saba Asili", code: "089", abbreviation: "SSA", symbol_name: "Wavy lines forming the letter 'S'" },
  # { name: "Kenya Party of National Unity", code: "090", abbreviation: "KPNU", symbol_name: "A handshake and a torch" },
  # { name: "Tunza Coalition", code: "091", abbreviation: "TUNZA", symbol_name: "Green leaf" },
  # { name: "National Economic Empowerment Party", code: "092", abbreviation: "NEEP", symbol_name: "Golden Yellow Ear of Corn" },
  # { name: "United Democratic Republic Party", code: "093", abbreviation: "UDRP", symbol_name: "Majestic Lion" },
  # { name: "Chama Kijamii", code: "094", abbreviation: "CK", symbol_name: "A person walking" },
  # { name: "New Vision Party", code: "095", abbreviation: "NVP", symbol_name: "Bright Sun with Seven Rays" },
  # { name: "Alliance for Democracy and Development", code: "096", abbreviation: "ADD", symbol_name: "Two shaking hands and a sun rising over mountains" },
  # { name: "Kenya Social Democratic Party", code: "097", abbreviation: "KSDP", symbol_name: "Two hands shaking" },
  # { name: "Partnership for Transformational Leadership", code: "098", abbreviation: "PTL", symbol_name: "Flying Dove with an Olive Branch" },
  # { name: "The Economic Stimulus Party", code: "099", abbreviation: "TESP", symbol_name: "A clock and a handshake" },
  # { name: "Demokrasia Mashinani Party", code: "100", abbreviation: "DM", symbol_name: "Circle with concentric rings" },
  # { name: "Chap Chap Party", code: "101", abbreviation: "CCP", symbol_name: "Road with a car" },
  # { name: "Safina Progressive Party", code: "102", abbreviation: "SPP", symbol_name: "White dove on a green background" },
  # { name: "Democratic Party", code: "103", abbreviation: "DPT", symbol_name: "Scale" },
  # { name: "Kazi Party of Kenya", code: "104", abbreviation: "KP", symbol_name: "Two green hands clasping" },
  # { name: "National Progressive Party", code: "105", abbreviation: "NPP", symbol_name: "Green triangle within a circle" },
  # { name: "The New National Vision Party", code: "106", abbreviation: "TNVP", symbol_name: "Tree" },
  # { name: "United Party of Kenya", code: "107", abbreviation: "UPK", symbol_name: "Two people holding hands" },
  # { name: "Jubilee Democratic Party", code: "108", abbreviation: "JDP", symbol_name: "Two hands clasping a globe" },
  # { name: "Umoja Summit Party of Kenya", code: "109", abbreviation: "USPK", symbol_name: "Two hands holding the Kenyan flag" },
  # { name: "Kenya Sovereign Party", code: "110", abbreviation: "KSP", symbol_name: "Two hands holding the world" },
  # { name: "Democratic Action Party", code: "111", abbreviation: "DAP", symbol_name: "Three arrows forming a triangle" },
  # { name: "United People's Democratic Party", code: "112", abbreviation: "UPDP", symbol_name: "Tree with three branches" },
  # { name: "Progressive Green Party of Kenya", code: "113", abbreviation: "PGP", symbol_name: "Green tree within a circle" },
  # { name: "Party of Action", code: "114", abbreviation: "PA", symbol_name: "Two hands holding a torch" },
  # { name: "New Democrats Party", code: "115", abbreviation: "NDP", symbol_name: "Bridge with two supporting columns" },
  # { name: "Liberation and Justice Party", code: "116", abbreviation: "LJP", symbol_name: "White dove carrying an olive branch" },
  # { name: "New National Vision Party", code: "117", abbreviation: "NNVP", symbol_name: "Yellow sun with a face" },
  # { name: "Kenya Democratic Party", code: "118", abbreviation: "KDP", symbol_name: "Two hands holding a book" },
  # { name: "Democratic Labour Party", code: "119", abbreviation: "DLP", symbol_name: "Two hands holding a scale" },
  # { name: "Kenya National Democratic Party", code: "120", abbreviation: "KNDP", symbol_name: "Two hands forming a heart shape" },
  # { name: "Labour and Social Democratic Party", code: "121", abbreviation: "LSDP", symbol_name: "Two hands holding a hammer" },
  # { name: "Democratic Green Party of Kenya", code: "122", abbreviation: "DGPK", symbol_name: "Green leaf within a circle" },
  # { name: "United Green Party", code: "123", abbreviation: "UGP", symbol_name: "Green leaf with a white background" },
  # { name: "Democratic Visionary Party", code: "124", abbreviation: "DVP", symbol_name: "Green tree with an open book" },
  # { name: "Maendeleo Party of Kenya", code: "125", abbreviation: "MPK", symbol_name: "Two hands holding a torch" },
  # { name: "People's Democratic Republic", code: "126", abbreviation: "PDR", symbol_name: "Two hands holding a sun" },
  # { name: "Democratic Congress Party", code: "127", abbreviation: "DCP", symbol_name: "Two hands forming a heart" },
  # { name: "National Labour Party", code: "128", abbreviation: "NLP", symbol_name: "Two hands holding a gear" },
  # { name: "Kenya Federal Party", code: "129", abbreviation: "KFP", symbol_name: "Two hands holding a key" },
  # { name: "Democratic Transformation Party", code: "130", abbreviation: "DTP", symbol_name: "Two hands forming a triangle" },
  # { name: "United Labour Party", code: "131", abbreviation: "ULP", symbol_name: "Two hands holding a wrench" },
  # { name: "Democratic Restoration Party", code: "132", abbreviation: "DRP", symbol_name: "Two hands holding a seed" },
  # { name: "Kenya Economic Party", code: "133", abbreviation: "KEP", symbol_name: "Two hands holding a coin" },
  # { name: "Democratic Change Party", code: "134", abbreviation: "DCP", symbol_name: "Two hands forming a peace sign" },
  # { name: "Kenya Reform Party", code: "135", abbreviation: "KRP", symbol_name: "Two hands holding a flag" },
  # { name: "Democratic Equality Party", code: "136", abbreviation: "DEP", symbol_name: "Two hands forming an equals sign" },
  # { name: "National Democratic Party", code: "137", abbreviation: "NDP", symbol_name: "Two hands holding a balance" },
  # { name: "People's Progressive Party", code: "138", abbreviation: "PPP", symbol_name: "Two hands forming a circle" },
  # { name: "Kenya Justice Party", code: "139", abbreviation: "KJP", symbol_name: "Two hands holding a gavel" },
  # { name: "Democratic Unity Party", code: "140", abbreviation: "DUP", symbol_name: "Two hands holding a dove" },
  # { name: "Kenya Progressive Party", code: "141", abbreviation: "KPP", symbol_name: "Two hands holding a sunflower" },
  # { name: "Democratic Solidarity Party", code: "142", abbreviation: "DSP", symbol_name: "Two hands forming a fist" },
  { name: "National Democratic Union", code: "143", abbreviation: "NDU", symbol_name: "Two hands holding a map" },
  { name: "People's Justice Party", code: "144", abbreviation: "PJP", symbol_name: "Two hands holding a scale" },
  { name: "Kenya Democracy Party", code: "145", abbreviation: "KDP", symbol_name: "Two hands forming a heart" },
  { name: "Democratic Development Party", code: "146", abbreviation: "DDP", symbol_name: "Two hands holding a plant" },
  { name: "Kenya Progressive Union", code: "147", abbreviation: "KPU", symbol_name: "Two hands holding a dove and an olive branch" },
  { name: "Democratic Alliance Party", code: "148", abbreviation: "DAP", symbol_name: "Two hands forming a triangle" },
  { name: "National Democratic Movement", code: "149", abbreviation: "NDM", symbol_name: "Two hands holding a gear" },
  { name: "People's Democracy Party", code: "150", abbreviation: "PDP", symbol_name: "Two hands holding a sun" }
]
parties.each do |party|
  Party.create!(
    name: party[:name],
    party_code: party[:code],
    abbreviation: party[:abbreviation],
    symbol_name: party[:symbol_name]
  )
end


# Create voters using Faker
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    role: User.roles.keys.sample, # Assign a random role from the enum
  )

  voter = Voter.new(
    full_names: Faker::Name.name,
    sex: Faker::Gender.binary_type,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    county: County.all.sample.name,
    subcounty: Subcounty.all.sample.name,
    national: ["Kenya"].sample,
    ward: Ward.all.sample,
    user: user, # Associate the voter with the created user
  )

  voter.save!
end

# Create candidates using Faker
10.times do
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
    ward: Ward.all.sample,
  )
  candidate.save!
end

puts "Seeding completed successfully."
