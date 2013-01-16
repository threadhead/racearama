class Pack < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state, :zipcode, :cubmaster_name, :pinewood_derby_chair, :website_url, :email

  has_many :dens
  has_many :tracks

  def has_associated?
    dens.count > 0 || tracks.count > 0
  end
end
