require('pg')
require_relative("../db/sql_runner")
require_relative("./customer")
require_relative('./ticket')

class Film


attr_reader :id
attr_accessor :title, :price

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @price = options ['price'].to_i
end

def save()
  sql = "INSERT INTO films
  (
    title,
    price
  )
    VALUES
    ($1, $2)

    RETURNING *"
    values = [@title, @price]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM films"
  SqlRunner.run(sql)
end


def self.find(id)
  sql = "SELECT FROM film WHERE id = $1"
  values = [@id]
  result = SqlRunner.run(sql,values)
  return result.map { |film| Film.new(film)}
end

def update()
    sql = "UPDATE films
    SET
    (
      title,
      price
    ) =
    (
    	$1, $2
    )
    WHERE id = $3"
    values = [@tile, @price, @id]
    result = SqlRunner.run(sql,values)
  end


 def customers()
   sql = "SELECT customers.*
   FROM customers
   INNER JOIN tickets
   ON tickets.customer_id = customers.id
   WHERE film_id = $1"
   values = [@id]
    customers = SqlRunner.run(sql,values)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end

  def customer_count
    sql = "SELECT * FROM tickets WHERE film_id = $1"
    values = [@id]
    result = SqlRunner.run(sql,values).count
    sql = "SELECT * FROM tickets WHERE fillm_id = $1"
    SqlRunner.run(sql,values).count
  end


end
