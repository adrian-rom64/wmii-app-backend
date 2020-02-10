class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :background
      t.integer :year
      t.string :specialization

      t.timestamps
    end
  end
end
