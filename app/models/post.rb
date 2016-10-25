# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  date        :datetime
#  image       :string
#  post_url    :string
#  state       :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
