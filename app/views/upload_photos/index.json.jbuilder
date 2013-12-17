json.array!(@upload_photos) do |upload_photo|
  json.extract! upload_photo, :name, :file, :size, :content_type
  json.url upload_photo_url(upload_photo, format: :json)
end
