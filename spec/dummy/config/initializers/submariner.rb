Submariner::WildCardSubdomain.config do |config|
  config.subdomains_to_ignore = ["www"]
  config.subdomain_block = lambda { |subdomain| Rails.logger.warn "Subdomain block ran for #{subdomain}" }
end
