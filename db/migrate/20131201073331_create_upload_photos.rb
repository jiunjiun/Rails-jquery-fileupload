class CreateUploadPhotos < ActiveRecord::Migration
  def change
    create_table :upload_photos do |t|
      t.string :name
      t.string :file
      t.string :size
      t.string :content_type

      t.timestamps
    end
  end
end
