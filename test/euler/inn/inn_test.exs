defmodule EulerWeb.InnTest do
  use ExUnit.Case

  describe "check_inn" do
    alias Euler.Helpers

    @valid_inn_1 "3329000313"
    @valid_inn_2 "500100732259"
    @invalid_inn_1 "8215737924062684"
    @invalid_inn_2 "qwerty123456"

    test "valid_inn_1/0 returns true" do
      assert Helpers.check_inn(@valid_inn_1) == true
    end

    test "valid_inn_2/0 returns true" do
      assert Helpers.check_inn(@valid_inn_2) == true
    end

    test "invalid_inn_1/0 returns true" do
      assert Helpers.check_inn(@invalid_inn_1) == false
    end

    test "invalid_inn_2/0 returns true" do
      assert Helpers.check_inn(@invalid_inn_2) == false
    end
  end
end
