class Primer
  attr_reader :name, :sequence, :note

  def initialize(name:, sequence:, note: "")
    @name = name
    @note = note
    @sequence = SequenceNormalizer.new(sequence).normalize
  end

  def overlap(position:, container:)
    start_pos = bindable_region(container, position).index(sequence)
    if start_pos
      binding_site = Position.new(
        start_pos: start_pos,
        end_pos: start_pos + size
      )

      target_within_bindable_region = Position.new(
        start_pos: size - 1 + initial_offset(position),
        end_pos: size - 1 + position.size + initial_offset(position)
      )

      binding_site.overlap_with(target_within_bindable_region)
    else
      0
    end
  end

  def bindable_region(contained_in, position)
    first_possible_position = [position.start_pos - size + 1, 0].max
    contained_in[first_possible_position...position.end_pos + size - 1]
  end

  def initial_offset(position)
    [position.start_pos - size + 1, 0].min
  end

  def reverse_complement
    Primer.new(
      name: name + "--reverse complement",
      sequence: sequence.reverse.tr("actg", "tgac"),
      note: note,
    )
  end

  def binding_end(target, overlap)
    if target.end_with?(sequence[0...overlap])
      :head
    elsif target.start_with?(sequence[-overlap..-1])
      :tail
    else
      :contained
    end
  end

  def ==(other)
    self.class == other.class &&
      name == other.name &&
      sequence == other.sequence &&
      note == other.note
  end

  private

  def size
    @_size ||= sequence.size
  end
end
