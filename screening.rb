require ('pg')
require_relative('./db/sql_runner')
require_relative('./models/film')
require_relative('./models/ticket')


class Screening

attr_reader :id, :film_id, :show_time




def initialize(options)
  @id = options['id'].to_i if options['id']
  @film_id = options['film_id']
  @show_time = options['show_time']
end


def save()
  sql = "INSERT INTO screenings
  (
    film_id,
    show_time)

  VALUES (
  $1,$2
  )
  RETURNING *"
  values = [@film_id, @show_time]
  result = SqlRunner.run(sql,values)
  @id = result[0]['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end












end
