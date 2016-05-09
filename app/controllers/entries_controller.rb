class EntriesController < ApplicationController
  include ActionController::Live

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to new_entry_url, notice: "Thank you!"
    else
      render :new
    end
  end

  #def index
  #  response.headers['Content-Type'] = 'text/event-stream'
  #    Entry.on_new_entry do |name|
  #      response.stream.write(sse({name: name}, {event: 'slide'}))
  #    end
  #  rescue IOError
  #    # Client Disconnected
  #  ensure
  #    response.stream.close
  #end
 def index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    begin
      loop do
        ActiveRecord::Base.connection.raw_connection.wait_for_notify do |event, pid, name|
          response.stream.write(sse({ :time => Time.now }))
          sleep 1
        end
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      response.stream.close
    end
  end

  #def index
  # response.headers['Content-Type'] = 'text/event-stream'
  #    sse = SSE.new(response.stream, retry: 300, event: "event-name")
  #    sse.write({ name: 'John'})
  #    sse.write({ name: 'John'}, id: 10)
  #    sse.write({ name: 'John'}, id: 10, event: "other-event")
  #    sse.write({ name: 'John'}, id: 10, event: "other-event", retry: 500)
  #  ensure
  #    sse.close
  #end

private
  def sse(object, options = {})
    (options.map{|k,v| "#{k}: #{v}" } << "data: #{JSON.dump object}").join("\n") + "\n\n"
  end

  def entry_params
    params.require(:entry).permit(:name)
  end

end
