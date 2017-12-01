defmodule Exblockchaininfo do
  @moduledoc """
  Documentation for Exblockchaininfo.
  """
import Http

  @doc """
  Total wallet balance
  """
  def balance do
    Http.wallet_balance
  end

  @doc """
  create new adress with label, do this parametr not required
  """
  def adress_new(label \\ "") do
    Http.address_create(label)
  end

  @doc """
  listing your addresses
  """
  def list do
    Http.list
  end

  def address_balance(address) do
    Http.address_balance(address)
  end

  def address_archive(address) do
    Http.address_archive(address)
  end

  def address_unarchive(address) do
    Http.address_unarchive(address)
  end

  # This method dont testing after refactoring because dont want spell BTC
  def sent_btc_to_one(amount, to, fee \\ 10000) do
    #send_btc(amount, to, fee \\ 10000)
  end

  @doc """
  Adress  balance
  """
  def balance(address) do
    #  This endpoint has been deprecated, for the best safety and security,
    #  use the HD API instead:
    #  https://github.com/blockchain/service-my-wallet-v3#enable-hd-functionality\
  end

end
