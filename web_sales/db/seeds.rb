# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	username: 							"Test",
	email: 									"test@gmail.com",
	password: 							"123456",
	password_confirmation: 	"123456",
)

User.create!(
	username: 							"Admin",
	email: 									"admin@gmail.com",
	password: 							"123456",
	password_confirmation: 	"123456",
	admin:									true
)

5.times do |n|
	name_1 		= "Sách thiếu nhi"
	name_2 		= "Kiến thức"
	name_3 		= "Tiểu thuyết"
	name_4 		= "Trinh thám"
	name_5 		= "Nghệ thuật"
	arr_name 	= [name_1, name_2, name_3, name_4, name_5]
	name 			= arr_name[n]
	
	Category.create!(
		name: 			name,
		parent_id: 	0
	)
end

50.times do
	category_id = rand(1..5)
	price 			= rand(3..7) * 10_000
	view 				= rand(1..10) * 10
	rating			= rand(1..5)

	name_1 			= "Ba Ngày Hạnh Phúc"
	name_2 			= "Có Những Ngày Hạnh Phúc Chừa Tôi Ra"
	name_3 			= "Hạnh Phúc Một Mình"
	arr_name 		= [ name_1, name_2, name_3 ]
	name 				= arr_name.sample

	image_1 		= "https://salt.tikicdn.com/cache/200x200/ts/product/33/98/d6/e56eee7384c071c95836577ee6b83eb5.jpg"
	image_2 		= "https://salt.tikicdn.com/cache/200x200/media/catalog/product/c/o/co-nhung-ngay-hanh-phuc_final-01.u547.d20160411.t092444.jpg"
	image_3			= "https://salt.tikicdn.com/cache/200x200/media/catalog/product/h/p/hp-1-minh.u5430.d20171031.t111750.891779_1.jpg"
	arr_image 	= [ image_1, image_2, image_3]
	picture 		= arr_image.sample

Product.create!(
	category_id:	category_id,
	name: 				name,
	price: 				price,
	description:  "Thật vô vọng khi thích một người không còn trên thế gian này.",
	image: 				picture,
	view:					view,
	rating:				rating
)
end