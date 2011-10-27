# encoding: utf-8
class TextSource < ActiveRecord::Base

  after_save :flush_cache

  def words
    stripped = content.gsub(/[^0-9가-힣.\s]/, '')
    sentences = stripped.split('.')
    words = sentences.map{|sentence| sentence.split(' ')[0..-2]}.flatten
  end

  def predicates
    stripped = content.gsub(/[^0-9가-힣.\s]/, '')
    sentences = stripped.split('.')
    predicates = sentences.map{|sentence| sentence.split(' ').last}
  end

  def flush_cache
    Rails.cache.delete 'predicates'
    Rails.cache.delete 'words'
  end
end
