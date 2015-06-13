class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.integer :template_id
    end
  end
end
