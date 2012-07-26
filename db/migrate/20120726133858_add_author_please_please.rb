class AddAuthorPleasePlease < ActiveRecord::Migration
  def change
    add_column :gnarus_exercise_attempts, :author_id, :string
  end
end
