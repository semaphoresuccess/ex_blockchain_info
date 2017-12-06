defmodule ExBlockchainInfo.Parameters do
  @moduledoc """
  Documentation for Parameters.
  """

  @password Application.get_env(:ex_blockchain_info, :main_pass)
  @second_pass Application.get_env(:ex_blockchain_info, :second_pass)

  def get_parameters do
    %{"password" => @password } |> Poison.encode!
  end

  def get_parameters("address_create", label) do
    %{
      "password" => @password,
      "second_password" => @second_pass,
      "label" => label
    } |> Poison.encode!
  end

  def get_parameters("address_" <> _, address) do
    %{
      "password" => @password,
      "second_password" => @second_pass,
      "address" => address
    } |> Poison.encode!
  end

  def get_parameters("payment", amount, to, fee) do
    %{
      "password" => @password,
      "second_password" => @second_pass,
      "amount" => amount,
      "fee" => fee,
      "to" => to
    } |> Poison.encode!
  end

end
