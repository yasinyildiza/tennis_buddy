class CreateSkillLevels < ActiveRecord::Migration[4.2]
  def change
    create_table :skill_levels do |t|
      t.string :name
      t.integer :minimum_years
      t.integer :maximum_years

      t.timestamps
    end
  end
end
