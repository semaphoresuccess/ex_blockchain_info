defmodule ExBlockchainInfo.Wallet do
  @moduledoc """
    Client for Blockchain Wallet API
  """

  def get_wallet_balance do
    params = ExBlockchainInfo.Parameters.get_parameters
    ExBlockchainInfo.Http.request("balance", params)
  end

  def create_address(label \\ "") do
    params = ExBlockchainInfo.Parameters.get_parameters("address_create", label)
    ExBlockchainInfo.Http.request("new_address", params)
  end

  def get_address_balance(address) do
    params =
      ExBlockchainInfo.Parameters.get_parameters("address_balance", address)
    ExBlockchainInfo.Http.request("address_balance", params)
  end

  def archive_address(address) do
    params =
      ExBlockchainInfo.Parameters.get_parameters("address_archive", address)
    ExBlockchainInfo.Http.request("archive_address", params)
  end

  def unarchive_address(address) do
    params =
      ExBlockchainInfo.Parameters.get_parameters("address_balance", address)
    ExBlockchainInfo.Http.request("unarchive_address", params)
  end

  def get_addresses_list do
    params = ExBlockchainInfo.Parameters.get_parameters
    ExBlockchainInfo.Http.request("list", params)
  end
end
