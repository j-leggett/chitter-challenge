require 'user_repository'
def reset_users_table
  seed_sql = File.read('spec/seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # 1
  it "Get all users" do

    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq '1'
    expect(users[0].name).to eq "Jack"
    expect(users[0].username).to eq "jack_chitter"
    expect(users[0].email_address).to eq "jack@mail.com"
    expect(users[0].password).to eq "pass1"

    expect(users[1].id).to eq '2'
    expect(users[1].name).to eq "Charlotte"
    expect(users[1].username).to eq "chaz_chitter"
    expect(users[1].email_address).to eq "chaz@mail.com"
    expect(users[1].password).to eq "pass2"

  end

  it "Get a single user" do

    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.name).to eq "Jack"
    expect(user.username).to eq 'jack_chitter'
    expect(user.email_address).to eq "jack@mail.com"
    expect(user.password).to eq "pass1"
  end

  it "creates a user" do
    repo = UserRepository.new

    new_user = User.new
    new_user.name = 'Ian'
    new_user.username = 'ian_chitter'
    new_user.email_address = 'ian@mail.com'
    new_user.password = 'pass3'

    repo.create(new_user)

    user = repo.all.last
    expect(user.id).to eq '3'
    expect(user.name).to eq "Ian"
    expect(user.username).to eq 'ian_chitter'
    expect(user.email_address).to eq "ian@mail.com"
    expect(user.password).to eq "pass3"
  end

  it "deletes a user" do
    repo = UserRepository.new

    repo.delete(1)
    users = repo.all
    expect(users.length).to eq 1
  end

  # it "updates a user" do
  #   repo = UserRepository

  #   user = User.new
  #   repo.update(1)
  # end

end
