require 'forgery'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    # Rake::Task['db:reset'].invoke
    #User.create!(:name => "Example User",
    #             :email => "example@railstutorial.org",
    #             :password => "foobar",
    #             :password_confirmation => "foobar")
    #99.times do |n|
    #  name  = Faker::Name.name
    #  email = "example-#{n+1}@railstutorial.org"
    #  password  = "password"
    #  User.create!(:name => name,
    #                :email => email,
    #                :password => password,
    #                :password_confirmation => password)
    # end
    Daily.record_timestamps = false
    300.times do |n|
      amount    = Forgery::Monetary.money  :min => 3, :max => 10
      name      = Forgery::Basic.text({:at_least => 3, :allow_numeric => false, :allow_upper => false})
      budgets   = Budget.where({:user_id => 1})
      items     = Item.where({ :budget_id => budgets  })
      item_ids  = items[rand(items.length-1)]["id"]
      daily     = Daily.create!(:amount => amount, :name => name, :item_id => item_ids)
      timestamp_date = Random.date
      daily.update_attribute(:created_at, timestamp_date)
      daily.update_attribute(:updated_at, timestamp_date)
    end  
    Daily.record_timestamps = true
  end
end
