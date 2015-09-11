# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Loic = User.create(
  email: 'loic@lewagon.org',
  password: 'testtest',
  profile_type: "Mover",
  profile_id: 1,
)
Hadrien = User.create(
  email: 'hadrien@lewagon.org',
  password: 'testtest',
  profile_type: "Customer",
  profile_id: 2,
  admin: true,
)
Julien = User.create(
  email: 'julien@lewagon.org',
  password: 'testtest',
  profile_type: "Customer",
  profile_id: 3,
  )

mover_1 = Mover.create(
  first_name: 'Loic',
  last_name: 'Geoffroy',
  phone_number: '0690807060',
  status: true,
)
customer_1 = Customer.create(
  first_name: 'Hadrien',
  last_name: 'Pirmez',
  phone_number: '0700988773',
)
customer_2 = Customer.create(
  first_name: 'Julien',
  last_name: 'Jacquemond',
  phone_number: '0700988773',
)
course_1 = Course.create(
  customer_id: 1,
  sku: "course_1",
  price_cents: 4910,
  kms: 1.25,
  time: 11,
  status: "pending",
)
Site_1_1 = Site.create(
  type_of: "pick_up",
  address: "25 Rue du Petit Musc, Paris, France",
  course_id: 1,
 latitude: 48.8528847,
 longitude: 2.3643089,
)
Site_1_2 = Site.create(
  type_of: "drop_off",
  address: "16 Villa Gaudelet, Paris, France",
  course_id: 1,
  latitude: 48.8648482,
  longitude: 2.3798534,
)
course_2 = Course.create(
  customer_id: 2,
  sku: "course_2",
  price_cents: 6630,
  kms: 6.25,
  time: 23,
  status: "pending",
)
Site_2_1 = Site.create(
  type_of: "pick_up",
  address: "309 Rue du Faubourg Saint-Antoine, Paris, France",
  course_id: 2,
  latitude: 48.8494693,
  longitude: 2.3929551,
)
Site_2_2 = Site.create(
  type_of: "drop_off",
  address: "Porte de Champerret, Paris, France",
  course_id: 2,
  latitude: 48.885794,
  longitude: 2.29375,
)
