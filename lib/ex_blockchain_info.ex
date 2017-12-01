defmodule ExBlockchainInfo do
  @moduledoc """
  Documentation for Exblockchaininfo.
  """
import HttpBlockchainInfo
  import Parameters
  def get_wallet_balance do
    HttpBlockchainInfo.request("balance", Parameters.get_parameters)
  end

  def create_address(label \\ "") do
    params = Parameters.get_parameters("address_create", label)
    HttpBlockchainInfo.request("new_address", params)
  end

  def get_address_balance(address) do
    params = Parameters.get_parameters("address_balance", address)
    HttpBlockchainInfo.request("address_balance", params)
  end

  def archive_address(address) do
    params = Parameters.get_parameters("address_archive", address)
    HttpBlockchainInfo.request("archive_address", params)
  end

  def unarchive_address(address) do
    params = Parameters.get_parameters("address_balance", address)
    HttpBlockchainInfo.request("unarchive_address", params)
  end

  def get_addresses_list do
    HttpBlockchainInfo.request("list", Parameters.get_parameters)
  end

  def send_single_payment(amount, fee \\ "10000", to) do
    params = Parameters.get_parameters("payment", amount, fee, to)
    HttpBlockchainInfo.request("payment", params)
  end

end
