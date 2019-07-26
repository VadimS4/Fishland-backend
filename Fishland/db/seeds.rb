# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'mechanize'
require 'byebug'
require 'json'

User.destroy_all
Fish.destroy_all
Favorite.destroy_all

@website = 'https://forum.americanexpedition.us'

mechanize = Mechanize.new
document = mechanize.get('https://forum.americanexpedition.us/freshwater-fish-information')
form = mechanize.page.parser.css('div.animalInfoIntro')

new_user = User.create(name: "John Snow", username: "winter", password: "123456")

form.each do |item|

    count = 0

    url = item.css('a')[0].values.join()
    info_page = mechanize.get(@website + url)

    fish_name = item.css('h3').text.chomp(' Information')
    
    case fish_name
    when "Largemouth Bass"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..2].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[4].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[5].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[3].css('li').text
    when "Rainbow Trout"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text + " " + info_page.css('div.experienceLeftColumn').css('p')[4].text + " " + info_page.css('div.experienceLeftColumn').css('p')[5].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..2].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[8].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[9].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[3].css('li').text
    when "Walleye"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..2].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[5].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[6].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[3].css('li').text
    when "Crappie"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..1].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[5].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[6].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[2].css('li').text
    when "Northern Pike"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..1].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[3].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[4].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[2].css('li').text
    when "Smallmouth Bass"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..2].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[6].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[8].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[3].css('li').text
    when "Brook Trout"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text + " " + info_page.css('div.experienceLeftColumn').css('p')[4].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..1].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[6].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[8].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[2].css('li').text
    when "Channel Catfish"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text + " " + info_page.css('div.experienceLeftColumn').css('p')[4].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..1].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[6].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[8].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[2].css('li').text
    when "Muskellunge"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..1].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[4].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[5].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[2].css('li').text
    when "Bluegill"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[3].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[5].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[1..2].css('li').text
    when "Salmon"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[1].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text + " " + info_page.css('div.experienceLeftColumn').css('p')[3].text + " " + info_page.css('div.experienceLeftColumn').css('p')[4].text + " " + info_page.css('div.experienceLeftColumn').css('p')[5].text + " " + info_page.css('div.experienceLeftColumn').css('p')[6].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[7].text + " " + info_page.css('div.experienceLeftColumn').css('p')[8].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[9].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[1].css('li').text
    when "Blue Catfish"
        fish_information = info_page.css('div.experienceLeftColumn').css('p')[0].text + " " + info_page.css('div.experienceLeftColumn').css('p')[2].text
        fish_facts = info_page.css('div.experienceLeftColumn').css('ul')[0..1].css('li').text
        fish_habitat = info_page.css('div.experienceLeftColumn').css('p')[4].text
        fish_diet = info_page.css('div.experienceLeftColumn').css('p')[5].text
        fishing_tips = info_page.css('div.experienceLeftColumn').css('ul')[2].css('li').text
    end

    fish = Fish.create(name: fish_name, information: fish_information, facts: fish_facts, habitat: fish_habitat, diet: fish_diet, tips: fishing_tips)
end


fish = Fish.first 
fish2 = Fish.last
favorite1 = Favorite.create(user_id: new_user.id, fish_id: fish.id)
favorite2 = Favorite.create(user_id: new_user.id, fish_id: fish2.id)


puts 'seeds done'