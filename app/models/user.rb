class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  enum role: [:guest, :member, :manager, :admin]

  has_many :entries, dependent: :destroy
  has_many :entry_reviewers, dependent: :destroy
  has_many :entry_logs, dependent: :destroy

  def to_s
    email
  end
end
