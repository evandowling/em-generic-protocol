class GenericProtocol < EventMachine::Connection
  HEADER_PREFIX = '|||'
  def post_init
    @connection_data_stream = ""
  end
  
  def recieve_data(data)
    @connection_data_stream << data
    operation = proc { process_connection_data }
    callback = proc { |result| result }
    EventMachine.defer(operation,callback)
  end
  
  def send_packet(packet)
    send_data(HEADER_PREFIX + [packet.length].pack('L') + packet)
  end
  
  protected
  
  def handle_new_packet(packet)
    #Abstract in the base class
  end
  
  def process_connection_data
    #chop off the bytes until you hit the HEADER_PREFIX
    while (first_header = @connection_data_stream.index(HEADER_PREFIX))
      @connection_data_stream = @connection_data_stream[first_header..-1]
      header = @connection_data_stream[3,4]    
      if header && header.length == 4 && message_length = header.unpack('L').first
        if @connection_data_stream.length >= 7 + message_length
          handle_new_packet(@connection_data_stream[7,message_length])
          @connection_data_stream = @connection_data_stream[7 + message_length..-1]
        else
          return
        end
      else
        return
      end
    end
  end
  
end