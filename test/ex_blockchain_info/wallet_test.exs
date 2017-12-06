defmodule ExBlockchainInfo.WalletTest do
  use ExUnit.Case, async: false

  import Mock

  @main_pass "password"
  @host "localhost"
  @port "3000"
  @guid "guid"

  setup do
    Application.put_env(:ex_blockchain_info, :main_pass, @main_pass)
    Application.put_env(:ex_blockchain_info, :host, @host)
    Application.put_env(:ex_blockchain_info, :port, @port)
    Application.put_env(:ex_blockchain_info, :guid, @guid)
  end

  test "get_wallet_balance() triggers correct url" do
    url = get_wallet_balance_url()
    params = %{"password" => nil } |> Poison.encode!
    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.get_wallet_balance()

      assert called HTTPoison.post(url, params, headers)
    end
  end

  defp get_wallet_balance_url do
    "http://localhost:3000/merchant/guid/balance"
  end

  defp successful_response do
    {:ok,
      %HTTPoison.Response{
        body: %{} |> Poison.encode!,
        status_code: 200
      }
    }
  end

end
