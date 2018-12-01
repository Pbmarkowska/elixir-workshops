defmodule Facelixir.Repo.Migrations.AddAgeToMessages do
  use Ecto.Migration

  def change do
    alter table(:messages) do 
      add(:age, :integer)
    end
  end
end
