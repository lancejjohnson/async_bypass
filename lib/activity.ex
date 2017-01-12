defmodule Ab.Activity do
  def all_pulls(urls) do
    Enum.map urls, fn url ->
      Task.start

    end
  end
end
