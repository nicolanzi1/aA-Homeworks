# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  house_id   :integer          not null
#
# Indexes
#
#  index_people_on_house_id  (house_id)
#
class Person < ApplicationRecord
    validates :name, :house, presence: true

    belongs_to :house,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
end
