defmodule Euler.Repo.Migrations.CreateChecks do
  use Ecto.Migration

  def change do
    create table(:checks) do
      add :inn, :string
      add :ip_address, :string
      add :is_correct, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:checks, [:inn])
  end
end
