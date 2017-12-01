defmodule Http do
  @moduledoc """
  Documentation for BlockinfoEx.
  """
  @host Application.get_env(:ex_blockchain_info, :host)
  @port Application.get_env(:ex_blockchain_info, :port)
  @guid Application.get_env(:ex_blockchain_info, :guid)
  @password Application.get_env(:ex_blockchain_info, :main_pass)
  @second_pass Application.get_env(:ex_blockchain_info, :second_pass)

  def wallet_balance do
    params = %{"password" => @password } |> Poison.encode!
    Exblockchaininfo.Http.request("balance", params)
  end

  def address_create(label \\ "") do
    params = %{"password" => @password, "second_password" => @second_pass, "label" => label} |> Poison.encode!
    request("new_address", params)
  end

  def list do
    params = %{"password" => @password} |> Poison.encode!
    request("list", params)
  end

  def address_balance(address) do
    params = %{"password" => @password, "address" => address} |> Poison.encode!
    request("address_balance", params)
  end

  def address_archive(address) do
    params = %{"password" => @password, "second_password" => @second_pass, "address" => address} |> Poison.encode!
    request("archive_address", params)
  end

  def address_unarchive(address) do
    params = %{"password" => @password, "second_password" => @second_pass, "address" => address} |> Poison.encode!
    request("unarchive_address", params)
  end

  def send_btc(amount, to, fee \\ 10000) do
    params           = %{"password" => @password, "second_password" => @second_pass, "amount" => amount, "to" => to} |> Poison.encode!
    request("payment", params)
  end

  def request(method, params) do
    url = "http://" <> @host <> ":" <> @port <> "/merchant/" <> @guid <> "/" <>method
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.post(url, params, %{"Content-Type" => "application/json"})
    body |> Poison.decode!
  end

  def send_multi(amount, to, fee \\ 10000) do
    #need to release
    huginn_url="http://localhost:3000/merchant//sendmany"
  end

end
