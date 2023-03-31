class AddListToReviews < ActiveRecord::Migration[7.0]
  def change
    def change
      add_reference :reviews, :list, null: false, foreign_key: true
      add_column :reviews, :comment, :text
      add_column :reviews, :rating, :integer
    end
  end
end
