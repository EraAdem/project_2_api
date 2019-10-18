class FlightSerializer < ActiveModel::Serializer
  attributes :id, :place, :date, :description
  has_one :user
end
