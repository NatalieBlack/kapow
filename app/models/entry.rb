class Entry < ActiveRecord::Base
  after_save :notify_new_entry

  def notify_new_entry
puts "NOTIFY #{channel}, #{ActiveRecord::Base.connection.quote self.name}"
    ActiveRecord::Base.connection.execute "NOTIFY #{channel}, #{ActiveRecord::Base.connection.quote self.name}"
  end

  def self.on_new_entry
    ActiveRecord::Base.connection.execute "LISTEN #{channel}"
    loop do
      connection.raw_connection.wait_for_notify do |event, pid, name|
        yield name 
      end
    end
  ensure
    connection.execute "UNLISTEN #{channel}"
  end

  private
  def channel
    "names"
  end

end
