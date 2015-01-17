class Review < ActiveRecord::Base
  enum decision: [:correct, :wrong, :improve]
  belongs_to :article
end
