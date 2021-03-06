require('pg')
require_relative("../db/sql_runner")
require_relative('./film')
require_relative('./customer')
class Ticket

  attr_reader :id, :customer_id, :film_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @customer_id = options['customer_id']
  @film_id = options['film_id']
end


def save()
  sql = "INSERT INTO tickets
  (
    customer_id,
    film_id

  )
    VALUES
    ($1, $2)

    RETURNING *"
    values = [@customer_id, @film_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def film()
  sql = "SELECT * FROM films
  WHERE id = $1"
  values = [@film_id]
  film = SqlRunner.run(sql, values).first
  return Film.new(film)
end


def customer()
  sql = "SELECT * FROM customers
  WHERE id = $1"
  values = [@customer_id]
  customer = SqlRunner.run(sql,values).first
  return Customer.new(customer)
end




end
