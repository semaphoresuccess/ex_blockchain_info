defmodule ExBlockchainInfo.Http do
  @moduledoc """
  Documentation for BlockinfoEx.
  """

  def request(method, params) do
    host = Application.get_env(:ex_blockchain_info, :host)
    port = Application.get_env(:ex_blockchain_info, :port)
    guid = Application.get_env(:ex_blockchain_info, :guid)

    url = "http://" <> host <> ":" <> port <> "/merchant/" <> guid <> "/" <> method
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.post(url, params, %{"Content-Type" => "application/json"})
    body |> Poison.decode!
  end

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body |> Poison.decode!}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

end
