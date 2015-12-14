class Position
  attr_reader :start_pos, :end_pos

  def initialize(start_pos:, end_pos:)
    @start_pos = start_pos
    @end_pos = end_pos
  end

  def size
    end_pos - start_pos
  end

  def ==(other)
    self.class == other.class &&
      start_pos == other.start_pos &&
      end_pos == other.end_pos
  end

  def overlap_with(other)
    [0, [end_pos, other.end_pos].min - [start_pos, other.start_pos].max].max
  end
end
