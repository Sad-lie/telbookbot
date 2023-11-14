defmodule Telbookbot.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table (:books) do
      add :title, :string
      add :author, :string
      add :srlno, :integer
      add :published, :integer

      timestamps()
    end
    end

  end
