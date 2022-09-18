class MakeKitLineNicknameRequired < ActiveRecord::Migration[7.0]
  def change
    change_column :kit_lines, :nickname, :string, null: false
  end
end
