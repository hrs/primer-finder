require_relative "position"

PrimerSearchError = Class.new(StandardError)

class PrimerSearcher
  attr_reader :primers, :target, :target_container

  def initialize(primers:, target:, target_container:)
    @primers = primers
    @target = SequenceNormalizer.new(target).normalize
    @target_container = SequenceNormalizer.new(target_container).normalize
  end

  def target_position
    # Note that this only finds the first position of the target in the
    # container. It won't notice if there's more than one.
    start_pos = target_container.index(target)
    if start_pos
      Position.new(
        start_pos: start_pos,
        end_pos: start_pos + target.size
      )
    else
      raise(
        PrimerSearchError,
        "That target doesn't seem to be in the container you provided."
      )
    end
  end

  def results
    potential_matches.map { |primer|
      overlap = primer.overlap(
        position: target_position,
        container: target_container
      )
      SearchResult.new(
        primer: primer,
        binding_length: overlap,
        primer_end: primer.binding_end(target, overlap),
      )
    }.select(&:successful?)
  end

  private

  def potential_matches
    primers + primers.map(&:reverse_complement)
  end
end
