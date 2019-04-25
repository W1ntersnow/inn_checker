defmodule EulerWeb.Message do
  alias Euler.Helpers
  alias Euler.Data

  def process_message(body) do
    trim_body = String.trim(body)
    is_correct = Helpers.check_inn(trim_body)
    check_params = %{:inn => trim_body, :ip_address => "0.0.0.0", :is_correct => is_correct}
    {:ok, result} = Data.create_check(check_params)
    txt_val = Helpers.get_text_value(is_correct)

    %{"dt" => result.inserted_at,
      "inn" => result.inn,
      "ip" => result.ip_address,
      "is_correct" => txt_val}
  end

end
