class AddAlternateImageToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :alternate_image, :string
  end
end
