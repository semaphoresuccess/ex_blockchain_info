defmodule ExBlockchainInfo.Market do
  def get_rates() do
    ExBlockchainInfo.Http.get("https://blockchain.info/en/ticker")
  end
end
