require 'json'

namespace :resources_import do

  desc "Import resources from AWS config JSON exported file"
  task import_aws_resources: [:environment] do
    json_file = File.read("#{Rails.root}/lib/assets/aws-config-results.json")

    data_hash = JSON.parse(json_file)

    puts "Importing resources"

    CloudResource.transaction do
      data_hash['results'].each do |aws_resource|
        cr = CloudResource.create(
          resource_name: aws_resource['resourceName'],
          resource_id: aws_resource['resourceId'],
          resource_type: aws_resource['resourceType'],
          resource_creation_time: aws_resource['resourceCreationTime'],
          cloud_provider: 0,
          cloud_provider_id: aws_resource['accountId'],
          aws_arn: aws_resource['arn'],
          tags: aws_resource['tags'].try(:to_json),
          relationships: aws_resource['relationships'].try(:to_json),
          tag_compliant: false
        )

        puts "#{cr.inspect} imported!"
      end
    end

    puts "Import finished!"
  end
end