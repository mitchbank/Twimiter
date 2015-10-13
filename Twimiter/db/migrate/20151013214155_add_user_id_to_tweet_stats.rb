class AddUserIdToTweetStats < ActiveRecord::Migration
  def change
    add_column :tweet_stats, :user_id, :string
  end
end
