class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :lab_queues, counter_cache: :users_count
  belongs_to :group
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :selected_queues, dependent: :destroy
  has_many :favorite_queues, through: :selected_queues, source: :lab_queue, dependent: :nullify
end
