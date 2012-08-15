# Submariner
Easy wildcard subdomains in rails

Basically this run a block and pass the subdomain to it so you can do interesting things like load a user based on subdomain etc.

    Submariner::WildCardSubdomain.config do |config|
      config.subdomains_to_ignore = ["www"] #Don't run the block for these domains
      config.subdomain_block = lambda { |subdomain| Rails.logger.warn "Subdomain block ran for #{subdomain}" } #Do something everytime a domain is detected
    end

This project rocks and uses MIT-LICENSE.
