defmodule EulerWeb.CheckController do
  use EulerWeb, :controller

  alias Euler.Data
  alias Euler.Data.Check
  alias Elixir.EulerWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    checks = Data.list_checks()
    render(conn, "index.html", checks: checks)
  end

  def new(conn, _params) do
    changeset = Data.change_check(%Check{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"check" => check_params}) do
    case Data.create_check(check_params) do
      {:ok, check} ->
        conn
        |> put_flash(:info, "Check created successfully.")
        |> redirect(to: Routes.check_path(conn, :show, check))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    check = Data.get_check!(id)
    {:ok, _check} = Data.delete_check(check)

    conn
    |> put_flash(:info, "Check deleted successfully.")
    |> redirect(to: Routes.check_path(conn, :index))
  end

end
