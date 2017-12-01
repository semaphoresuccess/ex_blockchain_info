defmodule ExBlockchainInfo do
  @moduledoc """
  Documentation for Exblockchaininfo.
  """
import HttpBlockchainInfo
  import Parameters
  def wallet_balance do
    HttpBlockchainInfo.request("balance", Parameters.parameters_get)
  end

  def address_create(label \\ "") do
    params = Parameters.parameters_get("address_create", label)
    HttpBlockchainInfo.request("new_address", params)
  end

  def address_balance(address) do
    params = Parameters.parameters_get("address_balance", address)
    HttpBlockchainInfo.request("address_balance", params)
  end

  def address_archive(address) do
    params = Parameters.parameters_get("address_archive", address)
    HttpBlockchainInfo.request("archive_address", params)
  end

  def address_unarchive(address) do
    params = Parameters.parameters_get("address_balance", address)
    HttpBlockchainInfo.request("unarchive_address", params)
  end

  def list do
    HttpBlockchainInfo.request("list", Parameters.parameters_get)
  end

  def payment(amount, fee \\ "10000", to) do
    params = Parameters.parameters_get("payment", amount, fee, to)
    HttpBlockchainInfo.request("payment", params)
  end

end
