defmodule EulerWeb.PageController do
  use EulerWeb, :controller
  alias Euler.Data
  alias Euler.Data.Check
  require Logger
  def index(conn, _params) do
    # Logger.info "INFO CONN #{inspect(conn)}"
    checks = Data.list_checks()
    render(conn, "index.html", checks: checks)
  end

end
