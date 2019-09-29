class ChangeColumnNullItemEvaluation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :evaluation, true
  end
end
