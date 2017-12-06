defmodule ExBlockchainInfo.MarketTest do
  use ExUnit.Case, async: false

  import Mock

  @rates %{
    "USD" => %{
      "15m" => 11236.79,
      "buy" => 11237.74,
      "last" => 11236.79,
      "sell" => 11235.83,
      "symbol" => "$"}
  }

  test "get_rates() triggers correct url" do
    mock = [
      get: fn("https://blockchain.info/en/ticker") -> successful_response() end
    ]
    with_mock HTTPoison, mock do
      ExBlockchainInfo.Market.get_rates()

      assert called HTTPoison.get("https://blockchain.info/en/ticker")
    end
  end

  test "get_rates() return correct strutcture for success flow" do
    mock = [
      get: fn("https://blockchain.info/en/ticker") -> successful_response() end
    ]
    with_mock HTTPoison, mock do
      assert {:ok, @rates } = ExBlockchainInfo.Market.get_rates()
    end
  end

  test "get_rates() return correct strutcture for error flow" do
    mock = [
      get: fn("https://blockchain.info/en/ticker") -> error_response() end
    ]
    with_mock HTTPoison, mock do
      assert {:error, _} = ExBlockchainInfo.Market.get_rates()
    end
  end

  defp successful_response do
    encoded_rates = @rates |> Poison.encode!
    {:ok,
      %HTTPoison.Response{
        body: encoded_rates,
        status_code: 200
      }
    }
  end

  defp error_response do
    {:error,
      %HTTPoison.Error{
        reason: "My awesome error"
      }
    }
  end
end
