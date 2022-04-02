#encoding: utf-8

if City.all.count == 0
	puts "Creating cities"

	City.create(name: "Adana")
	City.create(name: "Adıyaman")
	City.create(name: "Afyon")
	City.create(name: "Ağrı")
	City.create(name: "Amasya")
	City.create(name: "Ankara")
	City.create(name: "Antalya")
	City.create(name: "Artvin")
	City.create(name: "Aydın")
	City.create(name: "Balıkesir")
	City.create(name: "Bilecik")
	City.create(name: "Bingöl")
	City.create(name: "Bitlis")
	City.create(name: "Bolu")
	City.create(name: "Burdur")
	City.create(name: "Bursa")
	City.create(name: "Çanakkale")
	City.create(name: "Çankırı")
	City.create(name: "Çorum")
	City.create(name: "Denizli")
	City.create(name: "Diyarbakır")
	City.create(name: "Edirne")
	City.create(name: "Elazığ")
	City.create(name: "Erzincan")
	City.create(name: "Erzurum")
	City.create(name: "Eskişehir")
	City.create(name: "Gaziantep")
	City.create(name: "Giresun")
	City.create(name: "Gümüşhane")
	City.create(name: "Hakkari")
	City.create(name: "Hatay")
	City.create(name: "Isparta")
	City.create(name: "İçel (Mersin)")
	City.create(name: "İstanbul")
	City.create(name: "İzmir")
	City.create(name: "Kars")
	City.create(name: "Kastamonu")
	City.create(name: "Kayseri")
	City.create(name: "Kırklareli")
	City.create(name: "Kırşehir")
	City.create(name: "Kocaeli (İzmit)")
	City.create(name: "Konya")
	City.create(name: "Kütahya")
	City.create(name: "Malatya")
	City.create(name: "Manisa")
	City.create(name: "Kahramanmaraş")
	City.create(name: "Mardin")
	City.create(name: "Muğla")
	City.create(name: "Muş")
	City.create(name: "Nevşehir")
	City.create(name: "Niğde")
	City.create(name: "Ordu")
	City.create(name: "Rize")
	City.create(name: "Sakarya (Adapazarı)")
	City.create(name: "Samsun")
	City.create(name: "Siirt")
	City.create(name: "Sinop")
	City.create(name: "Sivas")
	City.create(name: "Tekirdağ")
	City.create(name: "Tokat")
	City.create(name: "Trabzon")
	City.create(name: "Tunceli")
	City.create(name: "Şanlıurfa")
	City.create(name: "Uşak")
	City.create(name: "Van")
	City.create(name: "Yozgat")
	City.create(name: "Zonguldak")
	City.create(name: "Aksaray")
	City.create(name: "Bayburt")
	City.create(name: "Karaman")
	City.create(name: "Kırıkkale")
	City.create(name: "Batman")
	City.create(name: "Şırnak")
	City.create(name: "Bartın")
	City.create(name: "Ardahan")
	City.create(name: "Iğdır")
	City.create(name: "Yalova")
	City.create(name: "Karabük")
	City.create(name: "Kilis")
	City.create(name: "Osmaniye")
	City.create(name: "Düzce")

	puts "Cities created"
end

if Gender.all.count == 0
	puts "Creating genders"

	Gender.create(name: "Female")
	Gender.create(name: "Male")
	Gender.create(name: "Not Specified")

	puts "Genders created"
end

if SkillLevel.all.count == 0
	puts "Creating skill levels"

	SkillLevel.create(name: "Beginner", minimum_years: 0, maximum_years: 1)
	SkillLevel.create(name: "Elementary", minimum_years: 1, maximum_years: 3)
	SkillLevel.create(name: "Intermediate", minimum_years: 3, maximum_years: 5)
	SkillLevel.create(name: "Advanced", minimum_years: 5, maximum_years: 100)

	puts "Skill levels created"
end

if TennisClub.all.count == 0
	puts "Creating tennis clubs"

	City.all.each do |city|
		TennisClub.create(city_id: city.id, name: "Club #{city.name}")
		TennisClub.create(city_id: city.id, name: "Club Youth")
		TennisClub.create(city_id: city.id, name: "Club Elite")
	end

	puts "Tennis clubs created"
end

if TennisCourt.all.count == 0
	puts "Creating tennis courts"

	City.all.each do |city|
		TennisCourt.create(city_id: city.id, name: "Toprak Kort")
		TennisCourt.create(city_id: city.id, name: "Çim Kort")
		TennisCourt.create(city_id: city.id, name: "Minik Kort")
		TennisCourt.create(city_id: city.id, name: "Büyük Kort")
	end

	puts "Tennis courts created"
end

if User.all.count == 0
	puts "Creating users"

	User.new(password: 1, password_confirmation: 1, city_id: 1,  tennis_club_id: 1,   tennis_court_id: 1,   birthday: "1900-01-01", gender_id: 1, age: 115, skill_level_id: 1, name: "Admin",      surname: "",         email: "admin@tennisbuddy.com",         about_me: "Admin").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 43, tennis_club_id: 126, tennis_court_id: 169, birthday: "1959-04-02", gender_id: 2, age: 54,  skill_level_id: 1, name: "İsmail",     surname: "Saray",    email: "ismail.saray@ingiltere.com",    about_me: "İngiltere'den sevgiler, İsmail Saray").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 6,  tennis_club_id: 16,  tennis_court_id: 21,  birthday: "1945-10-12", gender_id: 2, age: 67,  skill_level_id: 1, name: "Hacı",       surname: "Yıldız",   email: "haci.yildiz@aspava.com",        about_me: "Allah Sağlık Para Afiyet Versin Amin").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 6,  tennis_club_id: 16,  tennis_court_id: 21,  birthday: "1988-03-05", gender_id: 2, age: 27,  skill_level_id: 2, name: "Yasin",      surname: "Yıldız",   email: "yasin.yildiz@tennisbuddy.com",  about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 6,  tennis_club_id: 17,  tennis_court_id: 22,  birthday: "1981-08-08", gender_id: 2, age: 34,  skill_level_id: 4, name: "Roger",      surname: "Federer",  email: "roger.federer@grandslam.com",   about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 6,  tennis_club_id: 18,  tennis_court_id: 23,  birthday: "1980-06-17", gender_id: 1, age: 35,  skill_level_id: 4, name: "Venus",      surname: "Williams", email: "venus.williams@grandslam.com",  about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 34, tennis_club_id: 100, tennis_court_id: 133, birthday: "1978-06-04", gender_id: 1, age: 35,  skill_level_id: 2, name: "Name",       surname: "Surname",  email: "name.surname@domain.com",       about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 34, tennis_club_id: 100, tennis_court_id: 133, birthday: "1970-04-29", gender_id: 2, age: 45,  skill_level_id: 3, name: "Andre",      surname: "Agassi",   email: "andre.agassi@grandslam.com",    about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 34, tennis_club_id: 101, tennis_court_id: 134, birthday: "1986-06-03", gender_id: 2, age: 29,  skill_level_id: 4, name: "Rafael",     surname: "Nadal",    email: "rafael.nadal@grandslam.com",    about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 34, tennis_club_id: 101, tennis_court_id: 134, birthday: "1981-09-26", gender_id: 1, age: 34,  skill_level_id: 3, name: "Selena",     surname: "Williams", email: "selena.williams@grandslam.com", about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 34, tennis_club_id: 102, tennis_court_id: 135, birthday: "1971-08-12", gender_id: 2, age: 44,  skill_level_id: 3, name: "Pete",       surname: "Sampras",  email: "pete.sampras@grandslam.com",    about_me: "About me").save(validate: false)
	User.new(password: 1, password_confirmation: 1, city_id: 34, tennis_club_id: 102, tennis_court_id: 135, birthday: "1900-01-01", gender_id: 3, age: 115, skill_level_id: 4, name: "Mercimek",   surname: "Köftesi",  email: "mecimek@kofte.com",             about_me: "Bir sıkımlık canım var. Marulu severim ama ekmekle daha iyi giderim").save(validate: false)

	puts "Users created"
end

if Message.all.count == 0
	puts "Creating messages"

	Message.create(sender_id: 4, receiver_id: 2, title: "Title 1", content: "Content 1")
	Message.create(sender_id: 2, receiver_id: 3, title: "Title 2", content: "Content 2")
	Message.create(sender_id: 2, receiver_id: 3, title: "Title 3", content: "Content 3")
	Message.create(sender_id: 4, receiver_id: 4, title: "Title 4", content: "Content 4")
	Message.create(sender_id: 5, receiver_id: 5, title: "Title 5", content: "Content 5")
	Message.create(sender_id: 8, receiver_id: 6, title: "Title 6", content: "Content 6")
	Message.create(sender_id: 2, receiver_id: 5, title: "Title 7", content: "Content 7")
	Message.create(sender_id: 2, receiver_id: 8, title: "Title 8", content: "Content 8")
	Message.create(sender_id: 2, receiver_id: 4, title: "Title 9", content: "Content 9")
	Message.create(sender_id: 2, receiver_id: 2, title: "Title 10", content: "Content 10")
	Message.create(sender_id: 2, receiver_id: 3, title: "Title 11", content: "Content 11")
	Message.create(sender_id: 5, receiver_id: 9, title: "Title 12", content: "Content 12")
	Message.create(sender_id: 5, receiver_id: 3, title: "Title 13", content: "Content 13")
	Message.create(sender_id: 5, receiver_id: 4, title: "Title 14", content: "Content 14")
	Message.create(sender_id: 4, receiver_id: 3, title: "Title 15", content: "Content 15")
	Message.create(sender_id: 4, receiver_id: 3, title: "Title 16", content: "Content 16")
	Message.create(sender_id: 4, receiver_id: 5, title: "Title 17", content: "Content 17")
	Message.create(sender_id: 4, receiver_id: 7, title: "Title 18", content: "Content 18")

	puts "Messages created"
end

if Rating.all.count == 0
	Rating.create(sender_id: 4, receiver_id: 2, rate: 1)
	Rating.create(sender_id: 2, receiver_id: 4, rate: 2)
	Rating.create(sender_id: 5, receiver_id: 3, rate: 3)
	Rating.create(sender_id: 6, receiver_id: 4, rate: 4)
	Rating.create(sender_id: 3, receiver_id: 5, rate: 5)
	Rating.create(sender_id: 2, receiver_id: 6, rate: 1)
	Rating.create(sender_id: 2, receiver_id: 5, rate: 2)
	Rating.create(sender_id: 2, receiver_id: 8, rate: 3)
	Rating.create(sender_id: 2, receiver_id: 4, rate: 4)
	Rating.create(sender_id: 2, receiver_id: 2, rate: 5)
	Rating.create(sender_id: 2, receiver_id: 3, rate: 4)
	Rating.create(sender_id: 5, receiver_id: 9, rate: 1)
	Rating.create(sender_id: 5, receiver_id: 3, rate: 2)
	Rating.create(sender_id: 5, receiver_id: 4, rate: 4)
	Rating.create(sender_id: 4, receiver_id: 4, rate: 5)
	Rating.create(sender_id: 4, receiver_id: 3, rate: 1)
	Rating.create(sender_id: 4, receiver_id: 5, rate: 2)
	Rating.create(sender_id: 4, receiver_id: 7, rate: 4)
end

if InvitedUser.all.count == 0
	puts "Creating invited users"

	InvitedUser.create(inviter_id: 2, email: "abc@def.com")
	InvitedUser.create(inviter_id: 2, email: "xyz@def.com")
	InvitedUser.create(inviter_id: 2, email: "ghi@def.com")
	InvitedUser.create(inviter_id: 2, email: "ztr@def.com")
	InvitedUser.create(inviter_id: 3, email: "asd@def.com")
	InvitedUser.create(inviter_id: 4, email: "afg@def.com")
	InvitedUser.create(inviter_id: 5, email: "klm@def.com")
	InvitedUser.create(inviter_id: 6, email: "klm@def.com")
	InvitedUser.create(inviter_id: 5, email: "thn@def.com")
	InvitedUser.create(inviter_id: 4, email: "erg@def.com")
	InvitedUser.create(inviter_id: 2, email: "ert@def.com")
	InvitedUser.create(inviter_id: 7, email: "asd@def.com")
	InvitedUser.create(inviter_id: 9, email: "abc@def.com")

	puts "Invited users created"
end