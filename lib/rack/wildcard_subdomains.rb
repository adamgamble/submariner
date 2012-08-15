module Rack
  class WildCardSubdomains
    def initialize(app)
      @app = app
    end

    def call(env)
      #Lets leave it alone if we're in development
      return @app.call(env) if env["HTTP_HOST"] =~ /127\.0\.0\.1/

      #Move along, nothing to see here, subdomain we should ignore
      subdomain = nil
      matches = env["HTTP_HOST"].match(/([^\.]*)\..+\..+/)
      #Keep going if there isn't a subdomain
      if matches.nil?
        Rails.logger.warn "*** Submariner - No subdomain detected"
        return @app.call(env) unless matches
      end
      subdomain = matches[1]

      if Submariner::WildCardSubdomain.subdomains_to_ignore.include?(subdomain)
        Rails.logger.warn "*** Submariner - skipped domain #{subdomain} based on configuration"
        return @app.call(env)
      end
        Rails.logger.warn "*** Submariner - detected domain #{subdomain}"
        Submariner::WildCardSubdomain.subdomain_block.call(subdomain)
      @app.call(env)
    end
  end
end
