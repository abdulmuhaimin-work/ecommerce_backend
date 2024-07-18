defmodule EcommerceBackendWeb.FallbackController do
  use EcommerceBackendWeb, :controller

  def translate_error({msg, opts}) do
    # If the error message requires translation, use Gettext
    # Otherwise, return the message as is
    if count = opts[:count] do
      Gettext.dngettext(EcommerceBackendWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(EcommerceBackendWeb.Gettext, "errors", msg, opts)
    end
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)})
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> json(%{errors: %{detail: "Not Found"}})
  end
end
