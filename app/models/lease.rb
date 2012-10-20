class Lease
  include Mongoid::Document
  
  field :from, type: DateTime
  field :till, type: DateTime
  
  embedded_in :order
end