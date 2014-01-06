# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(:firstName => "Tayyab", :lastName => "Zahid", :userName =>"admin", :email => "admin@admin.com", :password => "helloworld", :contactNumber => "123456789", :type => "Admin", :approved => "true")
Admin.create(:firstName => "Saad", :lastName => "Masood", :userName =>"adminn", :email => "admin@admin.pk", :password => "helloworld", :contactNumber => "123456789", :type => "Admin", :approved => "true")

#Route MetroBus
Busstop.create(:busStopName => "Gajju Matta Bus Stop", :busStopLatLong => "31.3921306,74.3626678", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Dulam Bus Station", :busStopLatLong => "31.4055831,74.3604427", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Youhanabad Bus Station", :busStopLatLong => "31.4128577,74.3594346", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Nishtar Bus Station", :busStopLatLong => "31.4201076,74.3583883", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Atari Darbar Bus Station", :busStopLatLong => "31.4311441,74.3566854", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Kamahanr Bus Station", :busStopLatLong => "31.4414607,74.3551201", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Chungi Amar Sidhu Bus Station", :busStopLatLong => "31.4505656,74.3532946", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Ghazi Chowk Bus Station", :busStopLatLong => "31.4568412,74.35127849", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Qainchi Bus Station", :busStopLatLong => "31.4642958,74.3482542", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Ittefaq Hospital Bus Station", :busStopLatLong => "31.4794295,74.3419305", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Model Town Bus Station", :busStopLatLong => "31.4978731,74.3342954", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Kalma Chowk Bus Station", :busStopLatLong => "31.5038031,74.3317848", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Qaddafi Stadium Bus Stadium", :busStopLatLong => "31.512286,74.32843250", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Ichara Bus Station", :busStopLatLong => "31.53140609,74.3213564", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shama Bus Station", :busStopLatLong => "31.5389517,74.319200102", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Manzang Chungi Bus Stop", :busStopLatLong => "31.5471063,74.3158579", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Jain Mandir Bus Station", :busStopLatLong => "31.5608597,74.3088935", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Civil Secretariat Bus Station", :busStopLatLong => "31.5687379,74.30435039", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Naizi Chowk Bus Station", :busStopLatLong => "31.6009474,74.29921689", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shahdara Bus Terminal", :busStopLatLong => "31.676697,74.2907372", :busStopSecName => "", admin_id: nil)

#Route B-19
Busstop.create(:busStopName => "New Khan Adda", :busStopLatLong => "31.5482446,74.2687127", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Naizi BUs Terminal", :busStopLatLong => "31.5377311,74.28398529", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "CDGL Bus Terminal", :busStopLatLong => "31.53506,74.2833374", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Yateem Khana Chowk", :busStopLatLong => "31.5318993,74.2871527", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Scheme Morr", :busStopLatLong => "31.5252389,74.2835783", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Khali Khoti", :busStopLatLong => "31.5244397,74.2882568", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Flat Stop", :busStopLatLong => "31.5218586,74.29015009", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Dubai Chowk", :busStopLatLong => "31.519172,74.2917112", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Bhaikhay Waal Morr", :busStopLatLong => "31.50911309,74.3028653", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Campus Pull", :busStopLatLong => "31.5047224,74.3118989", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Barket Market", :busStopLatLong => "31.5011846,74.320533", :busStopSecName => "", admin_id: nil)
#kalam Chowk
Busstop.create(:busStopName => "Center Point", :busStopLatLong => "31.5064992,74.33707969", :busStopSecName => "", admin_id: nil)

#Route B-01
Busstop.create(:busStopName => "RA Bazar", :busStopLatLong => "31.5059295,74.3850463", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "PAF Colony", :busStopLatLong => "31.5495056,74.39120249", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Rahat Bakery", :busStopLatLong => "31.5307614,74.3765134", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Fortress Stadium", :busStopLatLong => "31.5306288,74.3646955", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "7 club Road", :busStopLatLong => "31.55120239,74.3411565", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "PC Hotel", :busStopLatLong => "31.5538355,74.33770179", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Governor House", :busStopLatLong => "31.5546035,74.3345904", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Zoo", :busStopLatLong => "31.5582055,74.3267584", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Charling Cross", :busStopLatLong => "31.5602168,74.3234968", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Regal Chowk", :busStopLatLong => "31.5621761,74.318563", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "High Court", :busStopLatLong => "31.5660583,74.3140662", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Anarkali", :busStopLatLong => "31.5688281,74.308632", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Secretariat", :busStopLatLong => "31.5695685,74.3047321", :busStopSecName => "", admin_id: nil)

#Route B-02
Busstop.create(:busStopName => "Azadi Chowk", :busStopLatLong => "31.5904825,74.30655039", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Texali Gate", :busStopLatLong => "31.5859706,74.3063253", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Bhati Gate", :busStopLatLong => "31.5805283,74.3061838", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Chouburgi", :busStopLatLong => "31.55376039,74.3055438", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "More Samanabad", :busStopLatLong => "31.5444017,74.2944672", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Bhala Stop", :busStopLatLong => "31.5395617,74.2928056", :busStopSecName => "", admin_id: nil)
#Yateem Khana
#Scheme Morr
Busstop.create(:busStopName => "Kharak Nallah", :busStopLatLong => "31.5092681,74.2713109", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Awan Town", :busStopLatLong => "31.5031886,4.26775959", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Multan Chungi", :busStopLatLong => "31.4961031,74.263823", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Thokar Bus Stop", :busStopLatLong => "31.4732593,74.2415312", :busStopSecName => "", admin_id: nil)

#Route B-04
Busstop.create(:busStopName => "Badami Bagh", :busStopLatLong => "31.6018492,74.3206208", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Railway Station", :busStopLatLong => "31.5770254,74.3389519", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "UET Gate Number 3", :busStopLatLong => "31.5768685,74.356724", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Begum Pura", :busStopLatLong => "31.5780863,74.36340609", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Singh Pura", :busStopLatLong => "31.4788101,74.36773079", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shalimar", :busStopLatLong => "31.5838262,74.38000869", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Akhari Mint", :busStopLatLong => "31.5859185,74.39530839", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Dhobi Gate", :busStopLatLong => "31.586585,74.3928637", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Droghawala", :busStopLatLong => "31.5870619,74.4037126", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Salamat Pura", :busStopLatLong => "31.5817024,74.4155663", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Jallo Morr", :busStopLatLong => "31.5783761,74.49693359", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Wagha", :busStopLatLong => "31.5901662,74.5758942", :busStopSecName => "", admin_id: nil)

#Route B-17
#Railyway Station
Busstop.create(:busStopName => "Police Station Gari Shahu", :busStopLatLong => "31.5609618,74.3503082", :busStopSecName => "", admin_id: nil)

#Route B-54
Busstop.create(:busStopName => "Police Station Gari Shahu", :busStopLatLong => "31.5609618,74.3503082", :busStopSecName => "", admin_id: nil)

#Route B-05
#Railway Station
Busstop.create(:busStopName => "Zoo", :busStopLatLong => "31.5582055,74.3267584", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Cheering Cross", :busStopLatLong => "31.5602168,74.3234968", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Ganga Ram", :busStopLatLong => "31.5549417,74.3209541", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Manzang Chungi", :busStopLatLong => "31.5471063,74.3158579", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Lahore College", :busStopLatLong => "31.542682,74.3277895", :busStopSecName => "", admin_id: nil)
#center Point
#RA Bazar
Busstop.create(:busStopName => "Ghazi Chowk", :busStopLatLong => "31.4367036,74.2908084", :busStopSecName => "", admin_id: nil)

#Route B-08
#Railway Station
Busstop.create(:busStopName => "Dharam Pura Stop", :busStopLatLong => "31.5529418,74.3587249", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Saddar Chowk", :busStopLatLong => "31.5482949,74.2802845", :busStopSecName => "", admin_id: nil)

#Route B-10
#Railway Station
#Zoo
#Cheering Cross
# Ganag Ram
#Manzang Chungi
#Shama
#Ichara
Busstop.create(:busStopName => "Rehman Pura", :busStopLatLong => "31.5217764,74.3198875", :busStopSecName => "", admin_id: nil)
#Qaddafi Station
#Kalma Chowk
#Model Town
Busstop.create(:busStopName => "Naseerabad", :busStopLatLong => "31.4868705,74.33881439", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Small Railway Crossing", :busStopLatLong => "31.4645797,74.3405744", :busStopSecName => "Phataki", admin_id: nil)
Busstop.create(:busStopName => "Peco Morr", :busStopLatLong => "31.4566614,74.3360136", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Treat Factory Stop", :busStopLatLong => "31.457649,74.3322713", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Pindi Stop", :busStopLatLong => "31.4600457,74.3269687", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Mochi Pura", :busStopLatLong => "31.4656664,74.31234959", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "KhoKhar Chowk", :busStopLatLong => "31.4699613,74.282596", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Lajna Chowk", :busStopLatLong => "31.4469432,74.2963317", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Butt Chowk", :busStopLatLong => "31.4431755,74.2943134", :busStopSecName => "", admin_id: nil)
#Ghazi Chowk
Busstop.create(:busStopName => "Umer Chowk", :busStopLatLong => "31.4444853,74.3063957", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Abu Bakar Chowk", :busStopLatLong => "31.4316567,74.2642844", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Rehmat Chowk", :busStopLatLong => "31.4197015,74.2653612", :busStopSecName => "", admin_id: nil)

#B-11
#Railway Station
#Jain Mandir
Busstop.create(:busStopName => "M.A.O College", :busStopLatLong => "31.5616361,74.3066421", :busStopSecName => "", admin_id: nil)
#Chouburgi
#Samanabad Morr
#Yateem Khana
#Scheme Morr
#Khali Khoti
#Flat Stop
#Dubai Chowk
#Bhaikhay Waal Morr
#Campus Pull
#Barket Market
Busstop.create(:busStopName => "Marria Stop", :busStopLatLong => "31.4917518,74.30921640", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "School Stop", :busStopLatLong => "31.4830562,74.3066568", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Khota Pind", :busStopLatLong => "31.47737649,74.3070546", :busStopSecName => "", admin_id: nil)
#Mochi Pura
#Pindi Stop
Busstop.create(:busStopName => "Nursery Stop", :busStopLatLong => "31.4527143,74.323352", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Hamdaed Stop", :busStopLatLong => "31.4473096,74.3203613", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Pully Stop", :busStopLatLong => "31.4368426,74.3144739", :busStopSecName => "", admin_id: nil)

#B-12
#Railway Station
#Gari Shahu Police Station
#Dharam Pura Stop
#Saddar Bazar
Busstop.create(:busStopName => "CMH Chowk", :busStopLatLong => "31.500475,74.37788669", :busStopSecName => "", admin_id: nil)
#Rahat Bakery
#RA Bazar
Busstop.create(:busStopName => "Shareef Market", :busStopLatLong => "31.4905039,74.3697435", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Walton Stop", :busStopLatLong => "31.4844839,74.3644944", :busStopSecName => "", admin_id: nil)
#Qainchi Bus Station
#Ghazi Chowk Bus Station
#Chungi Amar Sidhu
Busstop.create(:busStopName => "Bank Stop", :busStopLatLong => "31.4397947,74.3557799", :busStopSecName => "", admin_id: nil)
#Darbar Atari
#Nishtar Colony
#Youhanabad

#B-12A
#Azadi Chowk
#Badami Bagh 
#Railway Station
#Gari Shahu Police Station
#Dharam Pura 
#CMH Chowk
#Fortress
#RA Bazar

#B-14
#RA Bazar
#Shareef Market
#Walton Stop
#Qainchi
#Peco Morr
#Pindi Stop
#Nursery Stop
#Hamdaed Chowk
#Pully Stop

#B-16
#Azadi Chowk
#Texali Gate
Busstop.create(:busStopName => "Data Darbar", :busStopLatLong => "31.57869,74.3071004", :busStopSecName => "", admin_id: nil)
#Bhati Gate
#Secretariat
Busstop.create(:busStopName => "Old Anarkali", :busStopLatLong => "31.5676443,74.3106115", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Manzang Adda", :busStopLatLong => "31.55965,74.3139052", :busStopSecName => "", admin_id: nil)
#Ganga Ram
#Manzang Chungi
Busstop.create(:busStopName => "Eden Center", :busStopLatLong => "31.5471063,74.3158579", :busStopSecName => "", admin_id: nil)
#Lahore College
#Center Point
#Kalma Chowk
#Model Town
Busstop.create(:busStopName => "D Block Stop", :busStopLatLong => "31.4881345,74.3224213", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "F Block", :busStopLatLong => "31.481447,74.3220759", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shaheed Chowk", :busStopLatLong => "31.4930168,74.3199375", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Honda Morr Stop", :busStopLatLong => "31.4648268,74.31506929", :busStopSecName => "", admin_id: nil)
#Mochi Pura
Busstop.create(:busStopName => "Barket Chowk", :busStopLatLong => "31.4572562,74.3074893", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Al Karim Chowk", :busStopLatLong => "31.45640719,74.3138287", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Chandani Chowk", :busStopLatLong => "31.4524397,74.3082002", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Omer Chowk", :busStopLatLong => "31.4444853,74.3063957", :busStopSecName => "", admin_id: nil)

#B*17
#Railway Station
Busstop.create(:busStopName => "Bohar Wala Chowk", :busStopLatLong => "33.1318507,73.42000539", :busStopSecName => "", admin_id: nil)
#Gari Shahu Chowk
#Gari Shahu Police Station
#Dharam Pura
Busstop.create(:busStopName => "Mughal Pura", :busStopLatLong => "31.462804,74.3814888", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Jafery Pull", :busStopLatLong => "31.5631924,74.3860942", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Lal Pull", :busStopLatLong => "31.5643393,74.3903356", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "New Pull", :busStopLatLong => "31.5662297,74.3999934", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Fateh Garh", :busStopLatLong => "31.5673564,74.405617", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Aziz Pulli", :busStopLatLong => "31.5686933,74.4112399", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Taj Pura", :busStopLatLong => "31.558073,74.4061799", :busStopSecName => "", admin_id: nil)

#B-18
#Railway Station
#Gari Shahu Police Station
#Dharam Pura
#Mughal Pura
#Jafery Pull
#Lal Pull
#New Pull
#Taj Pura


#B-20
#Azadi Chowk
#Texali Gate
#Data Darbar
#Bhati
#Secretariat
#Jain Mandir
#Manzang Chungi
#Shama
#Ichara
#Rehman Pura
Busstop.create(:busStopName => "Aabpara Market", :busStopLatLong => "31.5202009,74.3208499", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Naqsha Stop", :busStopLatLong => "31.5172489,74.31633", :busStopSecName => "", admin_id: nil)
#Campus Pull
#Barket Market
#Marria Stop
#School Stop
#Khota Pind
#Mochi Pura
#Barket Chowk
#Al Karim Chowk
#Chandani Chowk
#Omer Chowk

#B-21
#Railway Station
#Azadi Chowk
#Naizi Chowk
#Shahdara Stop

#B-22
#Aziz Chowk
#Fateh Garh
#New Pull
#Lal Pull
#Jafery Pull
#Mughal Pull
#Dharam Pura
#Campus Pull
Busstop.create(:busStopName => "Wafaqi Colony", :busStopLatLong => "31.4858828,74.29334639", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Hanjarwal", :busStopLatLong => "31.4891477,74.2606579", :busStopSecName => "", admin_id: nil)
#Thokar Bus Stop

#B-23
#RA Bazar
#Ghazi Road
#Qainchi
#Peco Morr
#Treat Factory Stop
#Pindi Stop
#Mochi Pura
#Wafaqi Colony
#Hanjarwal 
#Thokar

#B-24
#Railway Station
Busstop.create(:busStopName => "Haji Camp", :busStopLatLong => "31.5707147,74.33436930", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shimla Hill", :busStopLatLong => "31.5622222,74.3372222", :busStopSecName => "", admin_id: nil)
#Zoo
#Charling Cross
#Ganga Ram
#Manzang Chungi
#Samanabad Morr
#Yateem Khana
#Scheme Morr
#Khali Khoti
#Flat Stop
#Dubai Chowk
#Bhaikhay Waal Morr
#Campus Pull
#School Stop
#Khota Pind
#Barket Chowk
#Al Karim Chowk
#Hamdaed Chowk
#Pully Stop

#B-26
#Chungi Amar
#Ghazi Chowk
#Qainchi
#Walton Stop
#Shareef Market
Busstop.create(:busStopName => "Defence Morr", :busStopLatLong => "31.4947192,74.3749148", :busStopSecName => "", admin_id: nil)
#RA Bazar
#Rahat Bakery
#CMH Chowk
#Saddar Bazar
#Mughal Pura
Busstop.create(:busStopName => "Ram Garh", :busStopLatLong => "31.569765,74.3808264", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shalimar Medical College", :busStopLatLong => "31.5763204,74.3810838", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shalimar Chowk", :busStopLatLong => "31.5838262,74.38000869", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Akhri Mint", :busStopLatLong => "31.5859185,74.39530839", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Dhobi Gart", :busStopLatLong => "31.586585,74.3982637", :busStopSecName => "", admin_id: nil)
#Droghawala
Busstop.create(:busStopName => "Salamat Pura", :busStopLatLong => "31.5817024,74.41556629", :busStopSecName => "", admin_id: nil)

#B-51
#Bhati
#Secretariat
#Chouburgi
#Manzang Chungi
#Ichara
Busstop.create(:busStopName => "FC College", :busStopLatLong => "31.5214313,74.3338194", :busStopSecName => "", admin_id: nil)
#Kalma Chowk
Busstop.create(:busStopName => "Phattak", :busStopLatLong => "31.2581375,74.22617819", :busStopSecName => "", admin_id: nil)
#Chungi Amar

#B-53
#Railway Station
Busstop.create(:busStopName => "Begum Kot", :busStopLatLong => "31.6166787,74.26708339", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Qila Sattar Shah", :busStopLatLong => "31.6636263,74.1330313", :busStopSecName => "", admin_id: nil)

#B-54
#Railway Station
#Bohar Wala Chowk
#Gari Shahu
#Gari Shahu Police
Busstop.create(:busStopName => "Jim Khana", :busStopLatLong => "31.54505,74.340683", :busStopSecName => "", admin_id: nil)
#Center Point
#Kalma Chowk
#Barket Market
#Marria Stop
Busstop.create(:busStopName => "Allah Ho Chowk", :busStopLatLong => "31.4692536,74.29827469", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Shoukat Khanam", :busStopLatLong => "31.4488244,74.2701091", :busStopSecName => "", admin_id: nil)
#Thokar

#B-56
#Thokar
Busstop.create(:busStopName => "Katchi Kothi", :busStopLatLong => "31.4507579,74.2459942", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Bhobattian Chowk", :busStopLatLong => "31.3966065,74.22997359", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Tibba", :busStopLatLong => "31.3090939,74.2245662", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Pajian", :busStopLatLong => "31.2998766,74.2244589", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Raiwind Phatak", :busStopLatLong => "31.2581375,74.22617819", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Raiwind Railwy Station", :busStopLatLong => "31.252225,74.22361859", :busStopSecName => "", admin_id: nil)

# Bus stop end

# Route Creation
Route.create(:routeName => "Metro", :routeSourceName => "helloworld", :routeDestName => "helloworld", :routeDistance => "27", :routeSourceLatLong => "11.11,11.11", routeDestLatLong: "11.11,11.11", admin_id: nil)
Route.create(:routeName => "B-01", :routeSourceName => "helloworld", :routeDestName => "helloworld", :routeDistance => "27", :routeSourceLatLong => "11.11,11.11", routeDestLatLong: "11.11,11.11", admin_id: nil)
Route.create(:routeName => "B-02", :routeSourceName => "helloworld", :routeDestName => "helloworld", :routeDistance => "27", :routeSourceLatLong => "11.11,11.11", routeDestLatLong: "11.11,11.11", admin_id: nil)
Route.create(:routeName => "B-04", :routeSourceName => "helloworld", :routeDestName => "helloworld", :routeDistance => "27", :routeSourceLatLong => "11.11,11.11", routeDestLatLong: "11.11,11.11", admin_id: nil)
Route.create(:routeName => "B-05", :routeSourceName => "helloworld", :routeDestName => "helloworld", :routeDistance => "27", :routeSourceLatLong => "11.11,11.11", routeDestLatLong: "11.11,11.11", admin_id: nil)
Route.create(:routeName => "B-08", :routeSourceName => "helloworld", :routeDestName => "helloworld", :routeDistance => "27", :routeSourceLatLong => "11.11,11.11", routeDestLatLong: "11.11,11.11", admin_id: nil)

