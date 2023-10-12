Sequel.migration do
  change do
    puts "Creating Tables..."

    create_table(:shoutouts) do
      primary_key :id
      String :name, null: false
      Date :shoutout, null: false
      String :discord
    end

    create_table(:messages) do
      primary_key :id
      String :regex, null: false
      String :text
      String :file
      String :emoji
      DateTime :time, null: false
    end
  end
end
