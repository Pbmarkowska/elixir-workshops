defmodule Facelixir.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :image])
    |> validate_required([:name, :email, :password])
    |> validate_format(:email, ~r/@/)

  end
end
