# ex. Issues.GithubIssues.fetch "elixir-lang", "elixir"

defmodule Issues.GithubIssues do
  @github_url Application.get_env(:issues, :github_url)
  @user_agent [{ "User-Agent", "Elixir Study" }]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({ :ok, %HTTPoison.Response{ status_code: 200, body: body } }) do
    { :ok, Poison.Parser.parse!(body) }
  end

  def handle_response({ _, %HTTPoison.Error{ reason: reason } }) do
    { :error, reason }
  end
end
