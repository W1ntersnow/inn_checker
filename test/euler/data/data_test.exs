defmodule Euler.DataTest do
  use Euler.DataCase

  alias Euler.Data

  describe "checks" do
    alias Euler.Data.Check

    @valid_attrs %{inn: "some inn", ip_address: "some ip_address", is_correct: true}
    @update_attrs %{inn: "some updated inn", ip_address: "some updated ip_address", is_correct: false}
    @invalid_attrs %{inn: nil, ip_address: nil, is_correct: nil}

    def check_fixture(attrs \\ %{}) do
      {:ok, check} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_check()

      check
    end

    test "list_checks/0 returns all checks" do
      check = check_fixture()
      assert Data.list_checks() == [check]
    end

    test "get_check!/1 returns the check with given id" do
      check = check_fixture()
      assert Data.get_check!(check.id) == check
    end

    test "create_check/1 with valid data creates a check" do
      assert {:ok, %Check{} = check} = Data.create_check(@valid_attrs)
      assert check.inn == "some inn"
      assert check.ip_address == "some ip_address"
      assert check.is_correct == true
    end

    test "create_check/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_check(@invalid_attrs)
    end

    test "update_check/2 with valid data updates the check" do
      check = check_fixture()
      assert {:ok, %Check{} = check} = Data.update_check(check, @update_attrs)
      assert check.inn == "some updated inn"
      assert check.ip_address == "some updated ip_address"
      assert check.is_correct == false
    end

    test "update_check/2 with invalid data returns error changeset" do
      check = check_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_check(check, @invalid_attrs)
      assert check == Data.get_check!(check.id)
    end

    test "delete_check/1 deletes the check" do
      check = check_fixture()
      assert {:ok, %Check{}} = Data.delete_check(check)
      assert_raise Ecto.NoResultsError, fn -> Data.get_check!(check.id) end
    end

    test "change_check/1 returns a check changeset" do
      check = check_fixture()
      assert %Ecto.Changeset{} = Data.change_check(check)
    end
  end
end
