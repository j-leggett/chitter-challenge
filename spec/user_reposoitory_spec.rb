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
    expect(users[0].email_address).to eq "jack@mail.com"
    expect(users[0].password).to eq "pass1"

    expect(users[1].id).to eq '2'
    expect(users[1].name).to eq "Charlotte"
    expect(users[1].email_address).to eq "chaz@mail.com"
    expect(users[1].password).to eq "pass2"

  end

  it "Get a single student" do

    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.name).to eq "Jack"
    expect(user.email_address).to eq "jack@mail.com"
    expect(user.password).to eq "pass1"
  end

# # Add more examples for each method
end
