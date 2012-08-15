require "submariner/railtie" if defined? Rails
module Submariner
  class WildCardSubdomain

    cattr_accessor :subdomains_to_ignore
    @@subdomain_block = nil

    def self.subdomain_block= block
      @@subdomain_block = block
    end

    def self.subdomain_block
      @@subdomain_block
    end

    def self.config &block
      block.call(self)
    end
  end
end
