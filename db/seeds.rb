# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Event.create(event_name: "h").skills.build([{skill_name: "tuck"}, {skill_name: "handspring"}])


Event.create(event_name: "Beam", gender: "Women's").skills.create([
	{
		skill_name: "Wolf Jump, Full Turn",
		element_group: "B",
		acro_series: false,
		dismount: false,
		mount: false,
		link: ""
	}, 
	{
		skill_name: "Aerial",
		element_group: "B",
		acro_series: true,
		dismount: false,
		mount: false,
		link: ""
	}, 
	{			
		skill_name: "Back Handspring Dismount",
		element_group: "A",
		acro_series: false,				
		dismount: true,
		mount: false,
		link: ""
	}, 
	{ 			
		skill_name: "The Dick",
		element_group: "A",
		acro_series: false,
		dismount: false,
		mount: true,
		link: ""
	}
])
Event.create(event_name: "Floor", gender: "Women's").skills.create([
	{			
		skill_name: "Back Handspring",
		element_group: "A",
		link: "https://www.youtube.com/embed/DZjS_HM97Qk?autoplay=1"
	},
	{			
		skill_name: "Back Tuck",
		element_group: "A",
		link: "https://www.youtube.com/embed/uFxQHe_Mxhc?autoplay=1"
	},			
	{			
		skill_name: "The Biles",
		element_group: "E",
		link: "https://www.youtube.com/embed/zM5tjn8T9mg?autoplay=1"
	}
])
Event.create(event_name: "Uneven Bars", gender: "Women's").skills.create([
	{
		skill_name: "Double Back Dismount",
		element_group: "C",
		dismount: true,
		mount: false,
		link: ""
	}, 
	{
		skill_name: "Kip",
		element_group: "A",
		dismount: false,
		mount: false,
		link: ""
	},			
	{
		skill_name: "Giant",
		element_group: "B",
		dismount: false,
		mount: false,
		link: ""
	},			
	{
		skill_name: "Salto Forward to Hang on High Bar",
		element_group: "C",
		dismount: false,
		mount: true,
		link: ""
	}
])
Event.create(event_name: "Vault", gender: "Women's").skills.create([
	{ skill_name: "Produnova", link: "https://www.youtube.com/embed/JPf9ruYJLo8?autoplay=1" }, 
	{ skill_name: "Yurchenko", link: "https://www.youtube.com/embed/Pm2vb3Bj19s?autoplay=1" }, 
	{ skill_name: "Tsukahara", link: "https://www.youtube.com/embed/pOgebfg4hh0?autoplay=1" }
])
		# Event.create(event_name: "Parallel Bars", gender: "Men's", level: 8)
		# Event.create(event_name: "High Bar", gender: "Men's", level: 8)
		# Event.create(event_name: "Pommel Horse", gender: "Men's", level: 8)
		# Event.create(event_name: "Floor", gender: "Men's", level: 8)
		# Event.create(event_name: "Vault", gender: "Men's", level: 8)