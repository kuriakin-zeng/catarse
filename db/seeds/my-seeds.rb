## Update this configuration seed and then run
## rake db:seed:my-seeds

puts "Adding OauthProvider settings..."

  puts "  Facebook..."

  ## catarse-local-dev Facebook App
  facebook = OauthProvider.find_or_initialize_by_name 'facebook' 
  facebook.update_attributes(
    key: '1606767386235959',
    secret: '5677832cba87d7f98ee70b069606524b',
    path: 'facebook'
  )
  
    
  #OauthProvider.create :name => 'Twitter', :key => 'myconsumerkey', :secret => 'myconsumersecret', :strategy => 'Twitter', :path => 'twitter'
  #OauthProvider.create :name => 'LinkedIn', :key => 'myconsumerkey', :secret => 'myconsumersecret', :strategy => 'LinkedIn', :path => 'linked_in'

###
## Uservoice.com seetings
## at YOURDOMAIN.uservoice.com/admin/settings#/channels
## Sendgrid Heroku Plugin Settings
puts "Creating Configuration entries..."
{
  
  catarse_fee: '0.13',
  company_name: 'Acorn Crowd Ventures',

  host: 'https://fathomless-caverns-8430.herokuapp.com/',
  base_domain: 'https://fathomless-caverns-8430.herokuapp.com/',
  base_url: "https://fathomless-caverns-8430.herokuapp.com/",

  facebook_url: "http://facebook.com/MY-FACEBOOK-PAGE",
  facebook_app_id: '1606767386235959',

  sendgrid_user_name: 'app35913358@heroku.com',                        
  sendgrid: 'Qwsa0000',                                                 
  mailchimp_url: "kuriakinzeng.com",

  blog_url: "kuriakinzeng.com",
  twitter_username: "kuriakin.zeng",
  email_contact: 'zeng.kuriakin@gmail.com',
  email_payments: 'zeng.kuriakin@gmail.com',
  email_projects: 'zeng.kuriakin@gmail.com',
  email_system: 'zeng.kuriakin@gmail.com',
  email_no_reply: 'zeng.kuriakin@gmail.com',
  support_forum: 'kuriakinzeng.com',
  
}.each do |name, value|
   conf = Configuration.find_or_initialize_by_name name
   conf.update_attributes({
     value: value
   })
end

puts 
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts 
end


puts 
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

Configuration.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'
