defmodule ExBlockchainInfo.Payment do
  @moduledoc """
    Client for Receive Payments API V2
  """

  def send_single_payment(amount, to, fee \\ "10000") do
    params =
      ExBlockchainInfo.Parameters.get_parameters("payment", amount, to, fee)
    ExBlockchainInfo.Http.request("payment", params)
  end
end
