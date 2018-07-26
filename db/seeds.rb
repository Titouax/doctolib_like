# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do |index|

  City.create(
    city_name: Faker::Name.first_name
  )

  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: rand(City.first.id..City.last.id)
  )

  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    postal_code: Faker::Address.zip,
    city_id: rand(City.first.id..City.last.id)
  )

  Appointment.create(
    date: Faker::Date.backward(30),
    patient_id: rand(Patient.first.id..Patient.last.id),
    doctor_id: rand(Doctor.first.id..Doctor.last.id),
    city_id: rand(City.first.id..City.last.id)
  )

  Speciality.create(
    name: Faker::Name.first_name
  )

  # these two last commands fill up the assemblies_parts table
  # give each part a random assembly
  Doctor.all.each do |doctor|
   doctor.speciality.push(Speciality.all.sample)
   doctor.save
  end

  # give each assembly a random part
  Speciality.all.each do |speciality|
   speciality.doctors.push(Doctor.all.sample)
   speciality.save
  end


end
