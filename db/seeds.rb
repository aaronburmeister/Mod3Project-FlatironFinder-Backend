# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserLanguage.destroy_all
UserFramework.destroy_all
User.destroy_all
Framework.destroy_all
Language.destroy_all

ruby = Language.create(name: "Ruby", icon_url: "")
python = Language.create(name: "Python", icon_url: "")
java = Language.create(name: "Java", icon_url: "")
php = Language.create(name: "PHP", icon_url: "")
cpp = Language.create(name: "C++", icon_url: "")
csharp = Language.create(name: "C#", icon_url: "")
c = Language.create(name: "C", icon_url: "")
swift = Language.create(name: "Swift", icon_url: "")
javascript = Language.create(name: "JavaScript", icon_url: "")
golang = Language.create(name: "GoLang", icon_url: "")
scala = Language.create(name: "Scala", icon_url: "")
kotlin = Language.create(name: "Kotlin", icon_url: "")

sinatra = Framework.create(name: "Sinatra", language: ruby )
rails = Framework.create(name: "Rails", language: ruby)
django = Framework.create(name: "Django", language: python)
flask = Framework.create(name: "Flask", language: python)
spring = Framework.create(name: "Spring", language: java)
laravel = Framework.create(name: "Laravel", language: php)
react = Framework.create(name: "React", language: javascript)
express = Framework.create(name: "Express", language: javascript)
hibernate = Framework.create(name: "Hibernate", language: java)
aspnet = Framework.create(name: "ASP.NET", language: csharp)
revel = Framework.create(name: "Revel", language: golang)
beego = Framework.create(name: "Beego", language: golang)
ktor = Framework.create(name: "Ktor", language: kotlin)