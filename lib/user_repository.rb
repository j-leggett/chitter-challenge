require_relative './user'
class UserRepository

  def all
    sql = 'SELECT id, name, username, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.username = record['username']
      user.email_address = record['email_address']
      user.password = record['password']
      users << user
    end
    return users
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, name, username, email_address, password FROM users WHERE id = $1;'

    result_set = DatabaseConnection.exec_params(sql, [id])

    record = result_set[0]
    user = User.new
    user.id = record['id']
    user.name = record['name']
    user.username = record['username']
    user.email_address = record['email_address']
    user.password = record['password']
    return user

  end

  def create(user)
    sql = 'INSERT INTO users (name, username, email_address, password) VALUES($1, $2, $3, $4);'
    params = [user.name, user.username, user.email_address, user.password]

    DatabaseConnection.exec_params(sql, params)
    return nil

  end

  # def update(user)
  #   sql = 'INSERT INTO users (name, username, email_address, password) VALUES($1, $2, $3, $4);'
  #   params = [user.name, user.username, user.email_address, user.password]

  # end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1'
    params = [id]

    DatabaseConnection.exec_params(sql, params)
    return nil
  
  end
end
