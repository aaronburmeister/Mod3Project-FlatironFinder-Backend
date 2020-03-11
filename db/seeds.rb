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

fake_brad = User.create(username: "fakebrad", password: "fakebrad", name: "Bradley Haley", email: "bradley@bradleyhaley.net", cohort: "Git Bits or Die Prying", campus: "Denver, CO", github: "https://github.com/bshaley25", linkedin: "https://www.linkedin.com/in/bradley-haley-44a85b19a/")
fake_jeremy = User.create(username: "fakejeremy", password: "hockeyrules", name: "Jeremy Gray", email: "Jeremy@Jeremy.net", cohort: "Git Bits or Die Prying", campus: "Denver, CO", github: "https://github.com/jtgray6", linkedin: "https://www.linkedin.com/in/jeremytgray6/", blog: "https://medium.com/@jeremytgray6")
fake_corey = User.create(username: "fakecorey", password: "coreybrah", name: "Corey Hodge", email: "Corey@CoreyHodge.net", cohort: "Git Bits or Die Prying", campus: "Denver, CO", github: "https://github.com/WordsPerMinute", linkedin: "https://www.linkedin.com/in/coreyhodge/", blog: "https://medium.com/@coreyhodgedotnet")
fake_kyle = User.create(username: "fakekyle", password: "letsgetitstartedinhere", name: "Kyle Coberly", email: "kyle@kylecoberly.net", campus: "Denver, CO", github: "https://github.com/kylecoberly", linkedin: "https://www.linkedin.com/in/kylecoberly/", blog: "https://medium.com/@kyle.coberly")
fake_adam = User.create(username: "fakeadam", password: "fakeadam", name: "Adam Shappy", email: "adam@adamshappy.net", campus: "Denver, CO", cohort: "Bits Please", github: "https://github.com/mrshappy0", linkedin: "https://www.linkedin.com/in/adam-shappy/", blog: "https://medium.com/@adam_shappy")



UserLanguage.create(user: fake_brad, language: ruby)
UserLanguage.create(user: fake_jeremy, language: ruby)
UserLanguage.create(user: fake_corey, language: ruby)
UserLanguage.create(user: fake_kyle, language: php)
UserLanguage.create(user: fake_kyle, language: python)
UserLanguage.create(user: fake_jeremy, language: java)
UserLanguage.create(user: fake_corey, language: cpp)
UserLanguage.create(user: fake_kyle, language: javascript)
UserLanguage.create(user: fake_brad, language: php)
UserLanguage.create(user: fake_brad, language: javascript)
UserLanguage.create(user: fake_jeremy, language: javascript)
UserLanguage.create(user: fake_corey, language: javascript)
UserLanguage.create(user: fake_adam, language: javascript)
UserLanguage.create(user: fake_adam, language: ruby)
UserLanguage.create(user: fake_adam, language: golang)

UserFramework.create(user: fake_brad, framework: laravel)
UserFramework.create(user: fake_brad, framework: rails)
UserFramework.create(user: fake_kyle, framework: rails)
UserFramework.create(user: fake_corey, framework: rails)
UserFramework.create(user: fake_jeremy, framework: rails)
UserFramework.create(user: fake_kyle, framework: react)
UserFramework.create(user: fake_kyle, framework: express)
UserFramework.create(user: fake_brad, framework: express)
UserFramework.create(user: fake_corey, framework: react)
UserFramework.create(user: fake_jeremy, framework: spring)
UserFramework.create(user: fake_kyle, framework: laravel)
UserFramework.create(user: fake_adam, framework: rails)
UserFramework.create(user: fake_adam, framework: beego)