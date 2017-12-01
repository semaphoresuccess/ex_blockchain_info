defmodule Httpblockchaininfo do
  @moduledoc """
  Documentation for BlockinfoEx.
  """
  @host Application.get_env(:ex_blockchain_info, :host)
  @port Application.get_env(:ex_blockchain_info, :port)
  @guid Application.get_env(:ex_blockchain_info, :guid)
  @password Application.get_env(:ex_blockchain_info, :main_pass)
  @second_pass Application.get_env(:ex_blockchain_info, :second_pass)

  def parameters_get do
    %{"password" => @password } |> Poison.encode!
  end

  def parameters_get("adress_create", label) do
    %{"password" => @password, "second_password" => @second_pass, "label" => label} |> Poison.encode!
  end

  def parameters_get("address_"<>_, address) do
    %{"password" => @password,"second_password" => @second_pass,  "address" => address} |> Poison.encode!
  end

  def parameters_get("payment", amount, fee, to) do
    %{"password" => @password, "second_password" => @second_pass, "amount" => amount, "fee" => fee, "to" => to} |> Poison.encode!
  end

  def request(method, params) do
    url = "http://" <> @host <> ":" <> @port <> "/merchant/" <> @guid <> "/" <>method
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.post(url, params, %{"Content-Type" => "application/json"})
    body |> Poison.decode!
  end

end
