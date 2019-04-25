defmodule Euler.Data.Check do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checks" do
    field :inn, :string
    field :ip_address, :string
    field :is_correct, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(check, attrs) do
    check
    |> cast(attrs, [:inn, :ip_address, :is_correct])
    |> validate_required([:inn, :ip_address, :is_correct])
    |> unique_constraint(:inn)
  end
end
