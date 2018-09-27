defmodule Phollow.Backend do
  require Logger
  
  def tour do
    case Mix.env do
      :dev -> compile
      _ -> 
        case :ets.lookup(:backend_cache, :current_tour) do
          [] ->
            t = compile
            :ets.insert(:backend_cache, {:current_tour, t})
            t
          t -> t[:current_tour]
        end
    end
  end

  defp compile do
    get("/shows/query?apikey=<<apikey>>&tourid=179&order=DESC")
  end

  def get(url) do
    {:ok, key} = Confex.fetch_env(:phollow, :backend_api_key)

    Logger.warn "===== API Request to dot net =====>"
    r = HTTPoison.get!(Application.get_env(:phollow, :backend_url) <> String.replace(url,"<<apikey>>",key)).body
      |> Poison.decode!
      |> Map.get("response")
      |> Map.get("data")
    Logger.warn "<======== Dot net response ========"

    r
  end
end