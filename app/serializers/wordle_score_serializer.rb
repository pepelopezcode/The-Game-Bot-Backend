class WordleScoreSerializer < ActiveModel::Serializer
  attributes :score
  belongs_to :user
end
