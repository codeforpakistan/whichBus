# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(:firstName => "Tayyab", :lastName => "Zahid", :userName =>"admin", :email => "admin@admin.com", :password => "helloworld", :contactNumber => "123456789", :type => "Admin", :approved => "true")
Admin.create(:firstName => "Saad", :lastName => "Masood", :userName =>"adminn", :email => "admin@admin.pk", :password => "helloworld", :contactNumber => "123456789", :type => "Admin", :approved => "true")

Busstop.create(:busStopName => "Gajju Matta Bus Stop", :busStopLatLong => "31.3921306,74.3626678", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Dulam Bus Station", :busStopLatLong => "31.4055831,74.3604427", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Youhanabad Bus Station", :busStopLatLong => "31.4128577,74.3594346", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Nishtar Bus Station", :busStopLatLong => "31.4201076,74.3583883", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Atari Darbar Bus Station", :busStopLatLong => "31.4311441,74.3566854", :busStopSecName => "", admin_id: nil)
Busstop.create(:busStopName => "Kamahanr Bus Station", :busStopLatLong => "31,4414607,74.3551201", :busStopSecName => "", admin_id: nil)
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
