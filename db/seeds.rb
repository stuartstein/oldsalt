members = []
members << Member.create(	first_name: "Mark",
							last_name: 	"Kars",
							password: 	"welcome123",
							picture: 	"https://lh3.googleusercontent.com/-tJoJdRofuzc/AAAAAAAAAAI/AAAAAAABfoY/fCZjBFm2fd4/photo.jpg",
							role: 		"Member",
							active: 	true,
							address1: 	"555 Haight St",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94117",
							email: 		"mark.kars@gmail.com",
							phone: 		"555-555-5555"
						)

members << Member.create(	first_name: "Sach",
							last_name: 	"Osterion",
							password: 	"welcome123",
							picture: 	"https://lh3.googleusercontent.com/-abFdHQ2hDZY/AAAAAAAAAAI/AAAAAAAAi50/BgJTHIvCE9I/photo.jpg",
							role: 		"Admin",
							active: 	true,
							address1: 	"522 Bryant St",
							address2: 	"Suite 220",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94107",
							email: 		"sach.osterion@gmail.com",
							phone: 		"555-555-5551"
						)

members << Member.create(	first_name: "Steve",
							last_name: 	"Stein",
							password: 	"welcome123",
							picture: 	"http://designspiration.net/data/avatars/528a8d156edd5_img-6646.jpg",
							role: 		"Admin",
							active: 	true,
							address1: 	"172 Germania St",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94117",
							email: 		"steve.stein@gmail.com",
							phone: 		"703-555-5555"
							)

members << Member.create(	first_name: "Jessica",
							last_name: 	"Wigs",
							password: 	"welcome123",
							picture: 	"https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-prn2/t1/1525704_10102897138328397_1736361187_n.jpg",
							role: 		"Admin",
							active: 	true,
							address1: 	"140 Fell St",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94117",
							email: 		"j.wigs@gmail.com",
							phone: 		"415-555-1232"
							)

members << Member.create(	first_name: "Andy",
							last_name:  "Lundgren",
							password: 	"welcome123",
							picture: 	"https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-prn1/t1/530315_771114119279_1602183214_n.jpg",
							role: 		"Member",
							active: 	false,
							address1: 	"552 Lexington St",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94110",
							email: 		"alundgren@gmail.com",
							phone: 		"415-525-3523"
							)

members << Member.create(	first_name: "Becca",
							last_name: 	"Fishman",
							password: 	"welcome123",
							picture: 	"https://pbs.twimg.com/profile_images/420937155376988160/aRdbluWm.jpeg",
							role: 		"Member",
							active: 	true,
							address1: 	"723 Haight St",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94117",
							email: 		"becfishman@gmail.com",
							phone: 		"555-555-5050"
							)

members << Member.create(	first_name: "Laura",
							last_name: 	"Herzl",
							password: 	"welcome123",
							picture: 	"https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-frc3/t1/310929_10100363109477527_1410065790_n.jpg",
							role: 		"Member",
							active: 	true,
							address1: 	"7234 14th Avenue",
							city: 		"San Francisco",
							state: 		"CA",
							zip: 		"94127",
							email: 		"lauraherzl@gmail.com",
							phone: 		"555-555-5051"
							)

events = []
events << Event.create(		start_date: DateTime.new(2014, 5, 29, 9, 30),
							end_date: DateTime.new(2014, 5, 29, 15, 15),
							picture: "http://upload.wikimedia.org/wikipedia/commons/d/dd/Black_Sea_fauna_Seahorse.JPG",
							capacity: 30,
							price: 75.00,
							oldsalt_fee: 7.50,
							location_name: "San Francisco DMV",
							address1:  "1377 Fell St",
							city: "San Francisco",
							state: "CA",
							zip: "94117",
							map_url: "https://www.google.com/maps/preview/place/California+Department+of+Motor+Vehicles/@37.7714061,-122.4415053,16z/data=!4m5!1m2!2m1!1sSan+Francisco+DMV!3m1!1s0x0:0x6f09af6cf62244bd",
							attire: "It might be chilly so wear layers, long pants, and closed shoes (no flats or sandals). Think Ralph Lauren/J.Crew style.",
							what_to_bring: "A cup (can be disposable)\nA mini pumpkin or gourd\nA pen\n$20 in cash",
							notes: "It's daylight savings time, so you get an extra hour of sleep. So don't show up at 8:30 :)\nIf you're a person who NEEDS COFFEE, feel free to come prepared--or, there's a Peet's at Oak and Broderick that you can stop at if you arrive early.",
							invite_line: "Becky and Jason cordially invite you to a day of mystery and adventure.",
							clue_url: "http://upload.wikimedia.org/wikipedia/commons/d/dd/Black_Sea_fauna_Seahorse.JPG",
							clue_text: "Get ready for a wild ride.",
							status: "Draft"	
						)

events << Event.create(		start_date: DateTime.new(2013, 7, 27, 9, 15),
							end_date: DateTime.new(2013, 7, 27, 1, 0),
							capacity: 25,
							price: 80.00,
							oldsalt_fee: 8.00,
							picture: "http://farm7.staticflickr.com/6009/5922730990_cd7896795e_o.jpg",
							location_name: "SF Yacht Club",
							address1:  "1 Yacht Rd",
							city: "San Francisco",
							state: "CA",
							zip: "94123",
							map_url: "https://www.google.com/maps/preview/place/Golden+Gate+Yacht+Club,+Yacht+Road,+San+Francisco,+CA/@37.807783,-122.4426093,17z/data=!3m1!4b1!4m2!3m1!1s0x8085812b8a91e24b:0xf6e1efe7e823a48a",
							attire: "Layers + http://yourllbeanboyfriend.tumblr.com/", 
							notes: "lunch will be included at 11:45ish\nFor what it's worth: we're pretty jazzed about the activity too -- no less than three people have emailed us over the past few months to suggest we add it to the queue. (Not to overhype it, but it was featured on the cover of SF Weekly as the Best _________ of San Francisco.)",
							invite_line: "You are invited to the third annual summer Shenanigan.",
							clue_url: "http://www.youtube.com/watch?v=5Sw61oITuts",
							clue_text: "Spend some time with this (...dramamine not included).",	
							status: "Archived"
						)

events << Event.create(		start_date: DateTime.new(2014, 6, 24, 12, 00),
							end_date: DateTime.new(2014, 6, 24, 3, 0),
							capacity: 20,
							price: 15.00,
							oldsalt_fee: 1.50,
							picture: "http://farm7.staticflickr.com/6009/5922730990_cd7896795e_o.jpg",
							location_name: "Sam's Anchor Cafe",
							address1:  "27 Main St",
							city: "Belvedere Tiburon",
							state: "CA",
							zip: "94920",
							map_url: "https://www.google.com/maps/preview/place/Sam's+Anchor+Cafe/@37.8816759,-122.463117,13z/data=!4m5!1m2!2m1!1ssams+near+Tiburon,+Belvedere+Tiburon,+CA!3m1!1s0x0:0xf7a21a31036599c0",
							attire: "Gentlemen please wear dress shoes.Think Jack Dorsey meets Justin Bieber meets Zach Morris.\n\nLadies please wear a dress/skirt and heels that strap around your feet. Think Rachel McAdams in the Notebook meets Rachel McAdams in Mean Girls. No need to buy something new, just wear something that you are comfortable in.",
							invite_line: "You have been tapped.",
							clue_url: "http://www.youtube.com/watch?v=a5q46rY5CeA",
							clue_text: "I cannot tell you much but I will tell you this: This is a shenanigan that you will not want to miss! On this day you will learn a new universal skill. You can use it anywhere, from France to Brazil.",
							status: "Live"
						)

events << Event.create(		start_date: DateTime.new(2014, 4, 15, 10, 0),
							end_date: DateTime.new(2014, 4, 16, 16, 0),
							capacity: 29,
							price: 20.00,
							oldsalt_fee: 2.00,
							picture: "http://farm2.staticflickr.com/1124/5154596724_abed755907_o.jpg",
							location_name: "Pier 23 Cafe",
							address1:  "Pier 23",
							city: "San Francisco",
							state: "CA",
							zip: "94111",
							map_url: "https://www.google.com/maps/preview/place/Pier+23+Cafe,+Pier+23,+San+Francisco,+CA/@37.8033577,-122.4009034,17z/data=!3m1!4b1!4m2!3m1!1s0x808580588fe27f65:0xdd704098c205fe0f",
							attire: "No open-toed shoes are allowed.",
							invite_line: "What will your future hold?",
							clue_url: "http://www.youtube.com/watch?v=fWZ4c66V1P4",
							clue_text: "The day is in some ways inspired by this 1988 movie.",
							status: "Live"
						)

attendees = []

# Event 1
attendees << Attendee.create(	event_id: 1,
								member_id: 1,
								is_lead: true,
								rsvp: "Yes",
								last_viewed: DateTime.new(2014, 5, 29, 8, 31)
							)

attendees << Attendee.create(	event_id: 1,
								member_id: 2,
								rsvp: "No",
								last_viewed: DateTime.new(2014, 5, 29, 7, 31)
							)

attendees << Attendee.create(	event_id: 1,
								member_id: 3
							)

attendees << Attendee.create(	event_id: 1,
								member_id: 4,
								last_viewed: DateTime.new(2014, 5, 28, 8, 30)
							)

attendees << Attendee.create(	event_id: 1,
								member_id: 5,
								rsvp: "Yes",
								last_viewed: DateTime.new(2014, 5, 29, 8, 31)
							)

attendees << Attendee.create(	event_id: 1,
								member_id: 6,
								rsvp: "Yes",
								guests: 1,
								last_viewed: DateTime.new(2014, 5, 24, 8, 31)
							)

attendees << Attendee.create(	event_id: 1,
								member_id: 7,
								rsvp: "Yes",
								guests: 1,
								last_viewed: DateTime.new(2014, 5, 23, 3, 51)
							)


# Event 2
attendees << Attendee.create(	event_id: 2,
								member_id: 1,
								rsvp: "Yes",
								last_viewed: DateTime.new(2013, 7, 14, 17, 33)
							)

attendees << Attendee.create(	event_id: 2,
								member_id: 2,
								is_lead: true, 
								rsvp: "Yes",
								last_viewed: DateTime.new(2013, 7, 14, 17, 33)
							)

attendees << Attendee.create(	event_id: 2,
								member_id: 3,
								rsvp: "Yes",
								guests: 2,
								last_viewed: DateTime.new(2013, 7, 14, 0, 33)
							)

attendees << Attendee.create(	event_id: 2,
								member_id: 4,
								last_viewed: DateTime.new(2013, 7, 14, 2, 33)
							)

attendees << Attendee.create(	event_id: 2,
								member_id: 5,
								rsvp: "Yes",
								last_viewed: DateTime.new(2013, 7, 14, 1, 33)
							)

attendees << Attendee.create(	event_id: 2,
								member_id: 6,
								rsvp: "Yes",
								guests: 1,
								last_viewed: DateTime.new(2013, 7, 14, 13, 33)
							)

attendees << Attendee.create(	event_id: 2,
								member_id: 7,
								rsvp: "Yes",
								guests: 1,
								last_viewed: DateTime.new(2013, 7, 14, 15, 33)
							)	
# Event 3
attendees << Attendee.create(	event_id: 3,
								member_id: 1,
								rsvp: "No",
								last_viewed: DateTime.new(2014, 2, 5, 3, 33)
							)

attendees << Attendee.create(	event_id: 3,
								member_id: 2, 
								rsvp: "No",
								last_viewed: DateTime.new(2014, 3, 12, 23, 50)
							)

attendees << Attendee.create(	event_id: 3,
								member_id: 3,
								is_lead: true,
								rsvp: "No",
								guests: 2,
								last_viewed: DateTime.new(2014, 4, 18, 9, 59)
							)

attendees << Attendee.create(	event_id: 3,
								member_id: 4,
							)

attendees << Attendee.create(	event_id: 3,
								member_id: 5,
								rsvp: "No",
								last_viewed: DateTime.new(2014, 5, 17, 12, 44)
							)

attendees << Attendee.create(	event_id: 3,
								member_id: 6,
								rsvp: "No",
								last_viewed: DateTime.new(2014, 1, 3, 18, 12)
							)

attendees << Attendee.create(	event_id: 3,
								member_id: 7,
								rsvp: "Yes",
								last_viewed: DateTime.new(2014, 3, 10, 12, 33)
							)			

# Event 4

attendees << Attendee.create(	event_id: 4,
								member_id: 1
							)

attendees << Attendee.create(	event_id: 4,
								member_id: 2,
								rsvp: "No",
								last_viewed: DateTime.new(2014, 3, 12, 23, 50)
							)

attendees << Attendee.create(	event_id: 4,
								member_id: 3,
								rsvp: "Yes",
								guests: 1,
								last_viewed: DateTime.new(2014, 1, 18, 9, 59)
							)

attendees << Attendee.create(	event_id: 4,
								member_id: 4,
								is_lead: true, 
								rsvp: "Yes",
								last_viewed: DateTime.new(2014, 2, 19, 12, 22)
							)

attendees << Attendee.create(	event_id: 4,
								member_id: 5,
								rsvp: "No",
								last_viewed: DateTime.new(2014, 2, 17, 12, 44)
							)

attendees << Attendee.create(	event_id: 4,
								member_id: 6,
								rsvp: "Yes",
								guests: 1,
								last_viewed: DateTime.new(2014, 1, 3, 18, 12)
							)

attendees << Attendee.create(	event_id: 4,
								member_id: 7,
								last_viewed: DateTime.new(2014, 3, 10, 12, 33)
							)