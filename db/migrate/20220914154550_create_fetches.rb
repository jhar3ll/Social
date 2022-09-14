class CreateFetches < ActiveRecord::Migration[6.0]
  def change
    create_table :fetches do |t|
      t.string :string

      t.timestamps
    end
  end
end
