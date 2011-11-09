# encoding: utf-8
class TextSource < ActiveRecord::Base

  after_save :flush_cache

  def words
    stripped = content.gsub(/[^0-9가-힣.?,\s]/, '')
    #sentences = stripped.split('.')
    #words = sentences.map{|sentence| sentence.split(' ')[0..-2]}.flatten
    words = stripped.split.select{|w| w.match(/[.?!]$/).nil?}
  end

  def predicates
=begin
    stripped = content.gsub(/[^0-9가-힣.?,\s]/, '')
    sentences = stripped.split('.')
    predicates = sentences.map{|sentence| sentence.split(' ').last}
=end
    stripped = content.gsub(/[^0-9가-힣.?,\s]/, '')
    predicates = stripped.split.select{|w| w.match(/[.?!]$/)}
  end

  def flush_cache
    Rails.cache.clear
  end
end
