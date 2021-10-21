class CloudResource < ApplicationRecord
  searchkick

  enum cloud_provider: [:aws, :gcp]
end
