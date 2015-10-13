class CreateTweetStats < ActiveRecord::Migration
  def change
    create_table :tweet_stats do |t|
      t.datetime :date
      t.integer :num_tweets
      t.integer :num_rt

      t.timestamps null: false
    end
  end
end
