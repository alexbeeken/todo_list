require("rspec")
require("pg")
require("task")

describe(Task) do
  # tests are here
end

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end
