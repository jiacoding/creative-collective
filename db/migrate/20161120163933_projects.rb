class Projects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.boolean :public, :null=>false, :default=>true
      t.string :status, :null=>false, :default=>'active'
      t.string :cover_image
      t.string :description

      t.timestamps
    end

    create_table :project_items do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :version
      t.boolean :active
      t.string :type
      t.binary :content
      t.string :description

      t.timestamps
    end

    create_table :project_permissions do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :item_type
      t.boolean :view_item, :null=>false, :default=>true
      t.boolean :add_item, :null=>false, :default=>true
      t.boolean :update_item, :null=>false, :default =>true
      t.boolean :invite_member, :null=>false, :default=>true
      t.boolean :is_admin, :null=>false, :default=>true

      t.timestamps
    end

    create_table :event_logs do |t|
      t.string :reference_table
      t.integer :reference_id
      t.string :source
      t.string :type
      t.string :detail

      t.timestamps
    end

    add_index :project_items, [:project_id, :user_id, :version], unique: true, name: 'by_project_user_version'

    add_index :project_permissions, [:project_id, :user_id, :item_type], unique: true, name: 'by_project_user_item_type'

    add_foreign_key :project_items, :projects, column: :project_id

    add_foreign_key :project_permissions, :projects, column: :project_id
  end
end
