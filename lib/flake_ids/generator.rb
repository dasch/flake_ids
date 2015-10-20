module FlakeIds
  class Generator
    EPOCH = Time.new(2015, 10, 01).to_i
    MAX_SEQ = 2 ^ 12

    def initialize
      @client_id = 0
      @generation = generate_timestamp
      @seq = 0
    end

    def generate
      generation = generate_timestamp

      if generation == @generation
        @seq += 1
        raise "max seq number exceeded" if @seq > MAX_SEQ
      elsif generation > @generation
        @generation = generation
        @seq = 0
      else
        raise "cannot go back in time!"
      end

      @generation << 12 + @seq
    end

    private

    def generate_timestamp
      Time.now.to_i - EPOCH
    end
  end
end
