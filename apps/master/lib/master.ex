defmodule Master do
  use Application
  require Logger

  def start(_type, _args) do
    Application.get_env(:app1, :clients)
    |> IO.inspect
  end
end
