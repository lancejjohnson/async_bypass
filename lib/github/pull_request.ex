defmodule Ab.Github.PullRequest do
  def get(path) do
    url = github_api() <> path

    case HTTPoison.get(url) do
      {:ok, response} ->
        {:ok, response.body}
      {:error, error} ->
        {:error, "Could not get pull requests at this time."}
    end
  end

  def get_alot(path) do
    tasks = Enum.map 0..2, fn _ ->
      Task.async fn -> get(path) end
    end

    tasks |> Enum.map(&(Task.await(&1)))
  end

  defp github_api do
    Application.get_env(:ab, :github_api)
  end
end
