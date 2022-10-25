class Reservation < ApplicationRecord
  belongs_to :post
  belongs_to :profile

  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "La fecha de terminación debe venir despues de la fecha de inicio")
    end
  end

end
