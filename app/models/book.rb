class Book < ApplicationRecord
  paginates_per 5
  has_many_attached :avatars

  def self.ransackable_attributes(_auth_object)
    ["name" , "author" , "price" , "quantity"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  # validate :avatars_file_types

  # private

  # def avatars_file_types
  #   return unless avatars.attached?

  #   avatars.each do |avatars|
  #     unless avatars.content_type.in?(%w(image/jpeg image/png image/jpg))
  #       errors.add(:avatars, 'must be JPEG, PNG, or JPG Format')
  #       break
  #     end
  #   end
  # end
end
