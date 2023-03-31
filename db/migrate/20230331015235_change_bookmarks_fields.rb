class ChangeBookmarksFields < ActiveRecord::Migration[7.0]
  def change
    change_table :bookmarks do |t|
      t.change :comment, :text
      t.remove :movie_id
      t.remove :list_id
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
    end
  end
end
