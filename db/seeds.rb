# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skill.create(
		event_name: "Beam",
		skill_name: "Wolf Turn, Full",
		element_group: "B",
		acro_series: false,
		dismount: false,
		mount: false,
		link: "https://www.youtube.com/embed/nquDtM5LHI0?start=8"
)
Skill.create(
		event_name: "Beam",
		skill_name: "Side Aerial",
		element_group: "B",
		acro_series: true,
		dismount: false,
		mount: false,
		link: "https://www.youtube.com/embed/sVPLCIge8_k?start=9"
)
Skill.create(
		event_name: "Beam",
		skill_name: "Gainer Layout Dismount",
		element_group: "A",
		acro_series: false,				
		dismount: true,
		mount: false,
		link: "https://www.youtube.com/embed/jOQN4Kg_sBw"
)
Skill.create(
		event_name: "Beam",
		skill_name: "The Dick",
		element_group: "A",
		acro_series: false,
		dismount: false,
		mount: true,
		link: "https://www.youtube.com/embed/xd_9Oa9gnh4?start=2"
)
Skill.create(
		event_name: "Floor",
		skill_name: "Back Handspring",
		element_group: "A",
		link: "https://www.youtube.com/embed/DZjS_HM97Qk"
)
Skill.create(
		event_name: "Floor",
		skill_name: "Back Tuck",
		element_group: "A",
		link: "https://www.youtube.com/embed/uFxQHe_Mxhc"
)
Skill.create(
		event_name: "Floor",
		skill_name: "The Biles",
		element_group: "E",
		link: "https://www.youtube.com/embed/zM5tjn8T9mg"
)
Skill.create(
		event_name: "Uneven Bars",
		skill_name: "Double Back Dismount",
		element_group: "C",
		dismount: true,
		mount: false,
		link: "https://www.youtube.com/embed/EGttsigbwMw?start=6"
)
Skill.create(
		event_name: "Uneven Bars",
		skill_name: "Kip",
		element_group: "A",
		dismount: false,
		mount: false,
		link: "https://www.youtube.com/embed/rmKzI6W8dbc?start=5"
)
Skill.create(
		event_name: "Uneven Bars",
		skill_name: "Giant",
		element_group: "B",
		dismount: false,
		mount: false,
		link: "https://www.youtube.com/embed/PIFJF3CRwcs"
)
Skill.create(
		event_name: "Uneven Bars",
		skill_name: "Swing Forward 540 Flight to Hang",
		element_group: "C",
		dismount: false,
		mount: true,
		link: "https://www.youtube.com/embed/o3fiFBr1MwA"
)
Skill.create(
		event_name: "Vault",
		skill_name: "Produnova", 
		link: "https://www.youtube.com/embed/JPf9ruYJLo8"
)
Skill.create(
		event_name: "Vault",
		skill_name: "Yurchenko", 
		link: "https://www.youtube.com/embed/Pm2vb3Bj19s"
)
Skill.create(
		event_name: "Vault",
		skill_name: "Tsukahara", 
		link: "https://www.youtube.com/embed/pOgebfg4hh0"
)