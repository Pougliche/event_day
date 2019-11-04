class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.belongs_to :users
      t.belongs_to :events
      t.string :stripe_customer_id
      t.timestamps
    end
  end
end
