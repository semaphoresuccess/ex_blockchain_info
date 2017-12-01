defmodule HttpBlockchainInfo do
  @moduledoc """
  Documentation for BlockinfoEx.
  """
  @host Application.get_env(:ex_blockchain_info, :host)
  @port Application.get_env(:ex_blockchain_info, :port)
  @guid Application.get_env(:ex_blockchain_info, :guid)

  def request(method, params) do
    url = "http://" <> @host <> ":" <> @port <> "/merchant/" <> @guid <> "/" <>method
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.post(url, params, %{"Content-Type" => "application/json"})
    body |> Poison.decode!
  end

end
