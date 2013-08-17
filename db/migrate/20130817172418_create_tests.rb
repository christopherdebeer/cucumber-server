class CreateTests < ActiveRecord::Migration
  def up
    create_table :tests do |t|
      t.text :cucumber
      t.text :steps
      t.timestamps
    end
  end

  def down
    drop_table :tests
  end
end
