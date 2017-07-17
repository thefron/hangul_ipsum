# encoding: utf-8

# TextSource is dictionary for text generation.
class TextSource < ActiveRecord::Base
  after_save :flush_cache

  def self.all_predicates
    Rails.cache.fetch('predicates') do
      Hash[all.map { |ts| [ts.id.to_s, ts.predicates] }]
    end
  end

  def self.all_words
    Rails.cache.fetch('words') do
      Hash[all.map { |ts| [ts.id.to_s, ts.words] }]
    end
  end

  def stripped_content
    @stripped_content ||= content.gsub(/[^0-9가-힣.?,\s]/, '')
  end

  def words
    stripped_content.split.select { |w| w.match(/[.?!]$/).nil? }
  end

  def predicates
    stripped_content.split.select { |w| w.match(/[.?!]$/) }
  end

  def flush_cache
    Rails.cache.clear
  end
end
