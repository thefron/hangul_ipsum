# Generator generate paragraphs from given text sources.
class Generator
  attr_accessor :text_source_ids, :paragraphs, :length

  def initialize(options = {})
    @text_source_ids = options.delete(:text_source_ids)
    @paragraphs = Integer(options.delete(:paragraphs) || 3)
    @length = Integer(options.delete(:length) || 6)
  end

  def generate
    Array.new(paragraphs).map { generate_paragraph(length) }.compact.join("\n\n")
  end

  private

  def generate_paragraph(num_sentence)
    num_sentence = [num_sentence + rand(3) - 1, 1].max
    Array.new(num_sentence).map { generate_sentence(6) }.compact.join(' ')
  end

  def generate_sentence(num_words)
    num_words = [num_words + rand(7) - 3, 2].max
    (words.sample(num_words) + [predicates.sample]).compact.join(' ')
  end

  def predicates
    @predicates ||= begin
      if text_source_ids
        TextSource.all_predicates.slice(*text_source_ids.map(&:to_i)).values.flatten
      else
        TextSource.all_predicates.values.flatten
      end
    end
  end

  def words
    @words ||= begin
      if text_source_ids
        TextSource.all_words.slice(*text_source_ids.map(&:to_i)).values.flatten
      else
        TextSource.all_words.values.flatten
      end
    end
  end
end
