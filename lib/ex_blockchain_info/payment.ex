defmodule ExBlockchainInfo.Payment do
  def send_single_payment(amount, to, fee \\ "10000") do
    params = ExBlockchainInfo.Parameters.get_parameters("payment", amount, to, fee)
    ExBlockchainInfo.Http.request("payment", params)
  end
end
