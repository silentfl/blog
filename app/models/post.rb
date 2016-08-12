require 'elasticsearch/model'

class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :category

  has_many :comments

  acts_as_taggable
end
