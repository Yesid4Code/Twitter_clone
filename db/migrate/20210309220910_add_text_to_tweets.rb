class AddTextToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :teet, :text
  end
end
