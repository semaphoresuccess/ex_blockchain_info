defmodule ExBlockchainInfo.Market do
  @moduledoc """
    Market Prices and exchanges rates api
  """

  def get_rates do
    ExBlockchainInfo.Http.get("https://blockchain.info/en/ticker")
  end
end
