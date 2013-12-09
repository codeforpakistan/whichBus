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
Busstop.create(:busStopName => "Qainchi Bus Station", :busStopLatLong => "31.4642958,74.3582542", :busStopSecName => "", admin_id: nil)
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
Busstop.create(:busStopName => "Kalma Chowk Bus Station", :busStopLatLong => "31.5038031,74.3317848", :busStopSecName => "", admin_id: nil)
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
Busstop.create(:busStopName => "Chowk Yateem Khana", :busStopLatLong => "31.5318993,74.2871527", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Scheme Morr", :busStopLatLong => "31.5252389,74.2835783", :busStopSecName => "", admin_id: nil)
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
Busstop.create(:busStopName => "Railway Station", :busStopLatLong => "31.5765102,74.3364888", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Police Station Gari Shahu", :busStopLatLong => "31.5609618,74.3503082", :busStopSecName => "", admin_id: nil)

#Route B-54
Busstop.create(:busStopName => "Police Station Gari Shahu", :busStopLatLong => "31.5609618,74.3503082", :busStopSecName => "", admin_id: nil)

Busstop.create(:busStopName => "", :busStopLatLong => "", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "", :busStopLatLong => "", :busStopSecName => "", admin_id: nil)
