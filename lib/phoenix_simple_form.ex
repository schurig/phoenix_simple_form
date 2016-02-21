defmodule PhoenixSimpleForm do
  @style_module Application.get_env(:phoenix_simple_form, :style, PhoenixSimpleForm.Styles.Bootstrap4)
  @inferrer_module Application.get_env(:phoenix_simple_form, :inferer, PhoenixSimpleForm.TypeInferrer)

  def error_notification(changeset) do
    if changeset.action do
      @style_module.error_notification(changeset)
    end
  end

  def input(f, name, opts \\ []) do
    type = @inferrer_module.run(f, name, opts)
    @style_module.input(type, f, name, opts)
  end
end
