defmodule Ab.PullRequestTest do
  use ExUnit.Case

  setup do
    bypass = Bypass.open
    url    = "http://localhost:#{bypass.port}"
    Application.put_env(:ab, :github_api, url)

    {:ok, bypass: bypass, path: "/repos/elixir-lang/elixir/pulls"}
  end

  @tag :no_async
  test "no aysnc calls", %{bypass: bypass, path: path} do
    Bypass.expect bypass, fn conn ->
      assert conn.method == "GET"
      assert conn.request_path == path

      Plug.Conn.resp(conn, 200, "")
    end

    Ab.Github.PullRequest.get(path)
  end

  @tag :has_async
  test "async calls", %{bypass: bypass, path: path} do
    Bypass.expect bypass, fn conn ->
      assert conn.method == "GET"
      assert conn.request_path == path

      Plug.Conn.resp(conn, 200, "")
    end

    Ab.Github.PullRequest.get_alot(path)
  end
end
