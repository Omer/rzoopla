module RZoopla
  class Listings < RZoopla::BaseCollection
    self.end_point = 'property_listings'
    self.results_field = :listing
    self.model = RZoopla::Listing
  end
end
