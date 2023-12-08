defmodule Telbookbot.Books do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :author, :string
    field :srlno, :integer
    field :published, :integer

    timestamps()
  end

  def changeset(book, params \\ %{}) do
    book
    |> cast(params, [:title, :author, :published, :srlno])
    |> validate_required([:title, :author, :published, :srlno])
  end
end
