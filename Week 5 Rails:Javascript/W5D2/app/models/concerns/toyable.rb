module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :imageable
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name: name)
    self.toys << toy if toy
  end
end
