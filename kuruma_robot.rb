# frozen_string_literal: true

require "logger"

class KurumaRobot < Sinatra::Base
  configure do
    enable :logging
  end

  configure :development do
    register Sinatra::Reloader # hot-reloading codes
  end

  configure :staging, :production do
    set :logger, Logger.new("log/#{environment}.log", "weekly")
    before do
      env["rack.logger"] = settings.logger

      query = env["QUERY_STRING"]
      msg = format("%s %s for %s",
                   env["REQUEST_METHOD"],
                   env["PATH_INFO"] + (query.empty? ? "" : "?#{query}"),
                   (env["HTTP_X_FORWARDED_FOR"] || env["REMOTE_ADDR"] || "-"))
      logger.info(msg)
    end
  end

  get "/" do
    client = Octokit::Client.new(access_token: ENV["github_token"])
    client.readme "vuongpdz/gh_api_test", accept: "application/vnd.github.html"
  end

  post "/update_master_data" do
    "
      We will receive master data here,
      create a PR to the repo, merge it to master
      release master to production
    "
    # (1) Get a reference to a branch HEAD (Ref to `main` branch): Get its SHA and the URL
    # (2) Get the URL in (1) and call GitHub API to get the HEAD commit object (its SHA and SHA of the tree, the tree URL)
    # (3) Get the tree in (2) from calling the tree URL
    # (4)
  end
end
