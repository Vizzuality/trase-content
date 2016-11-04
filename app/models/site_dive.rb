# == Schema Information
#
# Table name: site_dives
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  page_url    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SiteDive < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :page_url, presence: true

  def site_dive_url
    linker = (self.page_url.include?('?') ? '&' : '?')
    self.page_url + linker + 'site_dive_id=' + self.id.to_s
  end
end
