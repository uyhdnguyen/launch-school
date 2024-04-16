class CircularBuffer
    def initialize(max_size)
        @buffer = Array.new(max_size)
        @next_position = 0
        @oldest_position = 0
    end

    def put(obj)
        @oldest_position = increment(@next_position) unless @buffer[@next_position].nil?

        @buffer[@next_position] = obj
        @next_position = increment(@next_position)
    end

    def get
        value = @buffer[@oldest_position]
        @buffer[@oldest_position] = nil
        @oldest_position = increment(@oldest_position) unless value.nil?
        value
    end

    private

    def increment(pos)
        (pos + 1) % @buffer.size
    end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil