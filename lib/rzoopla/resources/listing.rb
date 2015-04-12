module RZoopla
  class Listing < RZoopla::BaseModel
    self.attributes = [
      :num_floors, :listing_status, :num_bedrooms, :latitude,
      :agent_address, :property_type, :longitude, :thumbnail_url, :description,
      :post_town, :details_url, :short_description, :outcode, :county, :price,
      :listing_id, :image_caption, :status, :agent_name, :num_recepts,
      :country, :displayable_address, :first_published_date, :price_modifier,
      :floor_plan, :street_name, :num_bathrooms, :price_change, :agent_logo,
      :agent_phone, :image_url, :last_published_date
    ]
  end
end
