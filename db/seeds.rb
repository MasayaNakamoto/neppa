# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: "admin@test",
  password: "123456"
)


Customer.create!(
  email:"test1@mail.com",
  password:"password",
  last_name:"山田",
  first_name:"太郎",
  last_name_kana:"ヤマダ",
  first_name_kana:"タロウ",
  phone_number:"0000000")
Customer.create!(
  email:"test2@mail.com",
  password:"password",
  last_name:"佐藤",
  first_name:"花子",
  last_name_kana:"サトウ",
  first_name_kana:"ハナコ",
  phone_number:"0000000")
Customer.create!(
  email:"test3@mail.com",
  password:"password",
  last_name:"あああ",
  first_name:"いいい",
  last_name_kana:"アアア",
  first_name_kana:"イイイ",
  phone_number:"0000000")


  [
  ["バスタオル", "お風呂屋さんの必需品", 1200, true, File.open("./app/assets/images/bath.jpeg")],
  ["洗顔", "スキンケア大事", 800, true, File.open("./app/assets/images/face.jpeg")],
  ["化粧水&乳液", "男は関係ないなんて時代じゃない", 1200, true, File.open("./app/assets/images/water.jpeg")],
  ["移動用サンダル", "お風呂入ってから靴下履いて靴はくのだるい時あるよね", 2000, true, File.open("./app/assets/images/sundle.jpeg")],
  ["シャンプー", "サウナ後の傷んだ髪にケア", 1000, true, File.open("./app/assets/images/water.jpeg")],

].each do |name, introduction, price, is_active, img|
  Item.create!(
    { name: name, introduction: introduction, price: price, is_active: is_active, image: img}
  )
end

Genre.create!(name: "京都")
Genre.create!(name: "大阪")
Genre.create!(name: "滋賀")
Genre.create!(name: "兵庫")
Genre.create!(name: "奈良")
Genre.create!(name: "和歌山")

Shop.create!(genre_id: 1, name: "みやこ温泉", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "京都府京都市山科区東野中井ノ上町", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 2, name: "まいどの湯", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "大阪府大阪市北区豊崎", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 3, name: "みずうみ湯", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "滋賀県近江八幡市長命寺町", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 4, name: "サウナ&スパこーべ", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "兵庫県尼崎市", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 5, name: "しか温泉", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "奈良県大和郡山市", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 6, name: "湯処みかん", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "和歌山県和歌山市", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 1, name: "まいこの湯", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "京都府京都市北区", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))
Shop.create!(genre_id: 3, name: "SPA レイク", introduction: "※こちらはポートフォリオサイトのため架空のお店です", price: 1000, postal_code: 1234567, address: "滋賀県草津市", phone_number: 1111234567, homepage: "https://twitter.com/04_nakamoto04/", sauna: "サウナの温度は95度で屋外に設置。水風呂も屋外に設置されており、温度は12度。外気浴が出来るよう畳のコーナーあり。", image: File.open("app/assets/images/sauna.jpg"))



CartItem.create(
    customer_id: 1,
    item_id: 1,
    amount: 2
  )