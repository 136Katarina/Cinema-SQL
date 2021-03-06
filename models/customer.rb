require('pg')
require_relative("../db/sql_runner")
require_relative("./film")
require_relative('./ticket')
class Customer

attr_reader :id
attr_accessor :name, :funds


def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @funds = options['funds']
end


def save ()
  sql = "INSERT INTO customers
  (
    name,
    funds
    )
    VALUES
    ($1,$2)

    RETURNING *"
    values = [@name, @funds]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM customers"
    result = SqlRunner.run(sql)
    return result.map{|customer| Customer.new(customer)}
  end
  #
  def self.find(search_id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [search_id]
    result = SqlRunner.run(sql,values)
    return result.map { |customer| Customer.new(customer)}
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
      sql = "UPDATE customers
      SET
      (
        name,
        funds
      ) =
      (
      	$1, $2
      )
      WHERE id = $3"
      values = [@name, @funds, @id]
      result = SqlRunner.run(sql,values)
    end

    def films()
      sql = "SELECT films.*
      FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      WHERE tickets.customer_id = $1"
      values = [@id]
      films = SqlRunner.run(sql, values)
      return films.map { |film| Film.new(film)}
    end

    def buy_ticket(film)
      @funds = @funds - film.price
      update()
    end

    def tickets_count
      sql = "SELECT * FROM tickets
      WHERE customer_id = $1"
      values = [@id]
      result = SqlRunner.run(sql,values).count
      SqlRunner.run(sql,values).count
    end


end
