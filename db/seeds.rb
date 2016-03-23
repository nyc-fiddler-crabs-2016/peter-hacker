# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create( username: "peter", password: "password")
Post.create(title: "posttitle1", url: "someplace.com", owner_id:1)
Comment.create(body:"blah blah blah", writer_id: 1, post_id: 1)
