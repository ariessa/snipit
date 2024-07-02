class MetadataJob
    include SuckerPunch::Job

    def perform(id)
        link = Link.find(id)
        link.update Metadata.retrieve_from(link.url).attributes
        link.broadcast_replace_to(link)

        rescue => e
            Rails.logger.error "Failed to update metadata for Link ##{id}: #{e.message}"
    end
end
