require( 'pry-byebug' )
require_relative( './models/customer' )
require_relative( './models/film' )
require_relative( './models/ticket')
require_relative( './screening')
#
#
# Screening.delete_all
# Ticket.delete_all
# Film.delete_all
# Customer.delete_all


customer1 = Customer.new({
  'name' => 'Keith',
  'funds' => 250})
customer1.save()
customer1.name = 'Katarina'
customer1.update()


customer2 = Customer.new({
    'name' => 'Sandy',
   'funds' => 200})
customer2.save()
customer2.name = 'Ilona'
customer2.update


customer3 = Customer.new({
    'name' => 'Craig',
   'funds' => 50})
customer3.save()


customer4 = Customer.new({
  'name' => 'Zsolt',
  'funds' => 50})
customer4.save()






film1 = Film.new({
  'title' => 'Memento',
  'price' => 10})
film1.save

film2 = Film.new({
  'title' => 'Inception',
  'price' => 9.00 })
film2.save

film3 = Film.new({
  'title' => '22 Jump Street',
  'price' => 11.00 })
film3.save

film4 = Film.new({
  'title' => 'Sausage Party',
  'price' => 12.00})
film4.save


ticket1 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save

ticket2 = Ticket.new ({
  'customer_id' => customer2.id,
  'film_id'=> film4.id
  })
ticket2.save
ticket3 = Ticket.new ({
  'customer_id' => customer2.id,
  'film_id' => film3.id
  })
ticket3.save

ticket4 = Ticket.new ({
  'customer_id' => customer4.id,
  'film_id' => film4.id,
    })
ticket4.save

screening1 = Screening.new ({
  'film_id' => film1.id,
  'show_time' => '14:00'
  })
screening1.save

screening2 = Screening.new ({
  'film_id' => film2.id,
  'show_time' => '18:50'
  })
screening2.save

screening3 = Screening.new ({
  'film_id' => film3.id,
  'show_time' => '16:20'
  })
screening3.save

screening4 = Screening.new ({
  'film_id' => film4.id,
  'show_time' => '19:30'
  })
screening4.save




binding.pry
nil
