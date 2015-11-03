class Device < ActiveRecord::Base
	has_many :covers
	validates :name, presence: true
	validates :name, uniqueness:  { message: "Device already present." }
end
