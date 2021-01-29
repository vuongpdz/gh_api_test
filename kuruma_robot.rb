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

  post "/commit_random_number_to_main_branch" do
    client = Octokit::Client.new(access_token: ENV["github_token"])
    repo = Octokit::Repository.form_url('https://github.com/vuongpdz/gh_api_test')
    workflow_info = client.workflows(repo)
    auto_create_pr_wf = workflow_info[:workflows].find { |wf| wf[:name] == 'Create-Random-Number-PR' }
    client.workflow_dispatch(repo, auto_create_pr_wf[:id], 'main')
  end
end
