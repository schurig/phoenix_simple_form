defmodule PhoenixSimpleFormTest do
  use ExUnit.Case
  doctest PhoenixSimpleForm

  # source: nil, impl: nil, id: nil, name: nil, data: nil, model: nil,
  #          hidden: [], params: %{}, errors: [], options: [], index: nil

  @form %Phoenix.HTML.Form{}
  test "the truth" do
    # input = PhoenixSimpleForm.input(@form, :name, as: :text_input)
    assert 1 + 1 == 2
  end
end
