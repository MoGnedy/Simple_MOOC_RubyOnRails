# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({name: "Student", description: "Can read items"})
r2 = Role.create({name: "Instructor", description: "Can read and create Courses. Can update and destroy own Courses"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})

i1 = Course.create({title: "Rayban Sunglasses", user_id: u2.id})
i2 = Course.create({title: "Gucci watch",user_id: u2.id})
i3 = Course.create({title: "Henri Lloyd Pullover",user_id: u3.id})
i4 = Course.create({title: "Porsche socks",user_id: u3.id})
