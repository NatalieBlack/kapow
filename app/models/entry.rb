class Entry < ActiveRecord::Base

  validates_presence_of :name

  after_save :pubnub_pub

  def self.pubnub_client
    @@pubnub ||= Pubnub.new(
        subscribe_key: ENV['sub-key'], 
          publish_key: ENV['pub-key'], 
            connect_callback: lambda {|msg| pubnub.publish(channel: pubnub_channel, message: 'Hello from PubNub Ruby SDK!!', http_sync: true)}
    )
  end
      
  def self.pubnub_sub
    pubnub_client.subscribe(channel: pubnub_channel) do |envelope|
        puts envelope.message
    end
  end

  def self.pubnub_channel
    'entries'
  end

  def pubnub_pub
    Entry.pubnub_client.publish(channel: Entry.pubnub_channel, message: name)
  end

end
