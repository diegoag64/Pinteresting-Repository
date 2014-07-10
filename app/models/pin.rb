
class Pin < ActiveRecord::Base
	Paperclip.options[:command_path] = 'C:/Program Files/ImageMagick-6.8.9-Q16'
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :description, presence: true
	validates :image, presence: true
	make_flaggable :like
	acts_as_votable
end

class AddCachedVotesToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cached_votes_total, :integer, :default => 0
    add_column :posts, :cached_votes_score, :integer, :default => 0
    add_column :posts, :cached_votes_up, :integer, :default => 0
    add_column :posts, :cached_votes_down, :integer, :default => 0
    add_column :posts, :cached_weighted_score, :integer, :default => 0
    add_column :posts, :cached_weighted_total, :integer, :default => 0
    add_column :posts, :cached_weighted_average, :float, :default => 0.0
    add_index  :posts, :cached_votes_total
    add_index  :posts, :cached_votes_score
    add_index  :posts, :cached_votes_up
    add_index  :posts, :cached_votes_down
    add_index  :posts, :cached_weighted_score
    add_index  :posts, :cached_weighted_total
    add_index  :posts, :cached_weighted_average

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :posts, :cached_votes_total
    remove_column :posts, :cached_votes_score
    remove_column :posts, :cached_votes_up
    remove_column :posts, :cached_votes_down
    remove_column :posts, :cached_weighted_score
    remove_column :posts, :cached_weighted_total
    remove_column :posts, :cached_weighted_average
  end
end