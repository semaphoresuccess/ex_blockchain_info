defmodule ExBlockchainInfo do
  @moduledoc """
  Documentation for Exblockchaininfo.
  """
  import ExBlockchainInfo.Http
  import ExBlockchainInfo.Parameters
  def get_wallet_balance do
    ExBlockchainInfo.Http.request("balance", ExBlockchainInfo.Parameters.get_parameters)
  end

  def create_address(label \\ "") do
    params = ExBlockchainInfo.Parameters.get_parameters("address_create", label)
    ExBlockchainInfo.Http.request("new_address", params)
  end

  def get_address_balance(address) do
    params = ExBlockchainInfo.Parameters.get_parameters("address_balance", address)
    ExBlockchainInfo.Http.request("address_balance", params)
  end

  def archive_address(address) do
    params = Parameters.get_parameters("address_archive", address)
    ExBlockchainInfo.Http.request("archive_address", params)
  end

  def unarchive_address(address) do
    params = Parameters.get_parameters("address_balance", address)
    ExBlockchainInfo.Http.request("unarchive_address", params)
  end

  def get_addresses_list do
    ExBlockchainInfo.Http.request("list", ExBlockchainInfo.Parameters.get_parameters)
  end

  def send_single_payment(amount, to, fee \\ "10000") do
    params = ExBlockchainInfo.Parameters.get_parameters("payment", amount, to, fee)
    ExBlockchainInfo.Http.request("payment", params)
  end

end
