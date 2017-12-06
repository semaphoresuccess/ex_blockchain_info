defmodule ExBlockchainInfo.WalletTest do
  use ExUnit.Case, async: false

  import Mock

  @main_pass "password"
  @second_pass "passwordpassword"
  @host "localhost"
  @port "3000"
  @guid "guid"
  @some_address "1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq"

  setup do
    Application.put_env(:ex_blockchain_info, :main_pass, @main_pass)
    Application.put_env(:ex_blockchain_info, :main_pass, @second_pass)
    Application.put_env(:ex_blockchain_info, :host, @host)
    Application.put_env(:ex_blockchain_info, :port, @port)
    Application.put_env(:ex_blockchain_info, :guid, @guid)
  end

  test "get_wallet_balance() triggers correct url" do
    url = get_wallet_balance_url()
    params = %{"password" => @main_pass } |> Poison.encode!
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

  test "create_address('label') triggers correct url" do
    url = create_address_url()
    params = %{
      "password" => @main_pass,
      "second_password" => @second_pass,
      "label" => "label"
    } |> Poison.encode!
    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.create_address("label")

      assert called HTTPoison.post(url, params, headers)
    end
  end

  test "create_address() triggers correct url" do
    url = create_address_url()
    params = %{
      "password" => @main_pass,
      "second_password" => @second_pass,
      "label" => ""
    } |> Poison.encode!
    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.create_address()

      assert called HTTPoison.post(url, params, headers)
    end
  end

  defp create_address_url do
    "http://localhost:3000/merchant/guid/new_address"
  end

  test "get_address_balance('address') triggers correct url" do
    url = get_address_balance_url()
    params = %{
      "password" => @main_pass,
      "second_password" => @second_pass,
      "address" => @some_address
    } |> Poison.encode!

    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.get_address_balance(@some_address)

      assert called HTTPoison.post(url, params, headers)
    end
  end

  defp get_address_balance_url do
    "http://localhost:3000/merchant/guid/address_balance"
  end

  test "archive_address('adress') triggers correct url" do
    url = archive_address_url()
    params = %{
      "password" => @main_pass,
      "second_password" => @second_pass,
      "address" => @some_address
    } |> Poison.encode!
    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.archive_address(@some_address)

      assert called HTTPoison.post(url, params, headers)
    end
  end

  defp archive_address_url do
    "http://localhost:3000/merchant/guid/archive_address"
  end

  test "unarchive_address('adress') triggers correct url" do
    url = unarchive_address_url()
    params = %{
      "password" => @main_pass,
      "second_password" => @second_pass,
      "address" => @some_address
    } |> Poison.encode!
    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.unarchive_address(@some_address)

      assert called HTTPoison.post(url, params, headers)
    end
  end

  defp unarchive_address_url do
    "http://localhost:3000/merchant/guid/unarchive_address"
  end

  test "get_addresses_list() triggers correct url" do
    url = get_addresses_list_url()
    params = %{"password" => @main_pass } |> Poison.encode!
    headers = %{"Content-Type" => "application/json"}
    mock = [post: fn(url, params, headers) -> successful_response() end]

    with_mock HTTPoison, mock do
      ExBlockchainInfo.Wallet.get_addresses_list()

      assert called HTTPoison.post(url, params, headers)
    end
  end

  defp get_addresses_list_url do
    "http://localhost:3000/merchant/guid/list"
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
