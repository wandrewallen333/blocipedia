class CreateIndexForCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :index_for_collaborators do |t|
    end

    add_index :wikis, :id, unique: true
    add_index :users, :id, unique: true
    add_index :collaborators, :id, unique: true
    add_index :collaborators, :wiki_id
    add_index :collaborators, :user_id
  end
end
