
class Pin < ActiveRecord::Base
	Paperclip.options[:command_path] = 'C:/Program Files/ImageMagick-6.8.9-Q16'
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :bucket => '******'
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
