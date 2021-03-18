class AddReferencesToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :user, type: :integer, null: false, foreign_key: true

    add_reference :comments, :user, type: :integer, null: false, foreign_key: true
  end
end
