defmodule Exblockchaininfo do
  @moduledoc """
  Documentation for Exblockchaininfo.
  """
import Httpblockchaininfo

  def wallet_balance do
    Httpblockchaininfo.request("balance", parameters_get)
  end

  def address_create(label \\ "") do
    params = parameters_get("adress_create", label)
    Httpblockchaininfo.request("new_address", params)
  end

  def address_balance(address) do
    params = parameters_get("address_balance", address)
    Httpblockchaininfo.request("address_balance", params)
  end

  def address_archive(address) do
    params = parameters_get("address_archive", address)
    Httpblockchaininfo.request("archive_address", params)
  end

  def address_unarchive(address) do
    params = parameters_get("address_balance", address)
    Httpblockchaininfo.request("unarchive_address", params)
  end

  def list do
    Httpblockchaininfo.request("list", parameters_get)
  end

  def payment(amount, fee \\ "10000", to) do
    params = parameters_get("payment", amount, fee, to)
    Httpblockchaininfo.request("payment", params)
  end

end
