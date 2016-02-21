# Phoenix Simple Form

Easy form handling for phoenix. Write `<%= input f, :name %>` and get wrappers with labels and error messages.
Infers the type, comes with styles for bootstrap.

[![Hex.pm Version](http://img.shields.io/hexpm/v/phoenix_simple_form.svg)](https://hex.pm/packages/phoenix_simple_form)

## Why

Usually you're styling your form the same across your app. Generators are okay but if you're writing
the same code over and over again. But the better solution is to find a good abstraction.
Simple form for phoenix does exactly that.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add phoenix_simple_form to your list of dependencies in `mix.exs`:

        def deps do
          [{:phoenix_simple_form, "~> 0.0.2"}]
        end

  2. Ensure phoenix_simple_form is started before your application:

        def application do
          [applications: [:phoenix_simple_form]]
        end

  3. Run
  
        mix deps.get

## Customization

You can customize [styles](#styles) and [inferrers](#type_inferrers).

### Styles

The default style for phoenix_simple_form is bootstrap4. (Feel free to [contribute](#contribution) styles other css frameworks)

If you want to customize the style, add the following setting to your `config.exs`:

```elixir
config :phoenix_simple_form,
  style: YourProject.YourStyle
```

Copy [this file](lib/phoenix_simple_form/styles/bootstrap4.ex) into your project. Rename the module name accordingly to your config setting.

To add a new style, just create a new input function.

```elixir
def input(:custom_checkbox, f, name, opts) do
  content_tag :div, wrapper_html(opts, %{class: "checkbox"}) do
    [
      label(f, name, class: "checkbox") do
        [
        checkbox(f, name, input_html(opts, %{})), label_translation(f, name)]
      end,
      error_tag(f, name)
    ]
  end
end
```

You can use this by passing the as: option to an input field. E.g. `<%= input f, :admin, as: :custom_checkbox %>`.

If want to use this type every time a field is named admin or ends with `_count` or whatever, you can extend the type inferrer.
See the next section for more information.

### Type Inferrers

Inferrers try to infer the right input type for the available data. The default order is:

1. Is the type is set explicitly with `as:`, use this type.

2. If not, try to infer the type from the parameters. E.g. if the options list contains `collection:`, the type is automatically set to select field.

3. If nothing else matches, read the model type from the database. Then e.g. `:integer` is mapped to a number input. `:boolean` is mapped to a checkbox.

If you want to customize the inferrer, add the following setting to your `config.exs`:

```elixir
config :phoenix_simple_form,
  inferrer: YourProject.YourInferrerModule
```

Copy [this file](lib/phoenix_simple_form/type_inferrer.ex) into your project. Rename the module name accordingly to your config setting.


## Acknowledgments

The project is heavily inspired by [Simple Form](https://github.com/plataformatec/simple_form) for Rails.

## Contribution

This project uses the [C4.1 process](http://rfc.zeromq.org/spec:22) for all code changes.

> "Everyone, without distinction or discrimination, SHALL have an equal right to become a Contributor under the
terms of this contract."

### tl;dr

1. Check for [open issues](https://github.com/sbrink/phoenix_simple_form/issues) or [open a new issue](https://github.com/sbrink/phoenix_simple_form/issues/new) to start a discussion around [a problem](https://www.youtube.com/watch?v=_QF9sFJGJuc).
2. Issues SHALL be named as "Problem: _description of the problem_".
3. Fork the [phoenix_simple_form repository on GitHub](https://github.com/sbrink/phoenix_simple_form) to start making your changes
4. If possible, write a test which shows that the problem was solved.
5. Send a pull request.
6. Pull requests SHALL be named as "Solution: _description of your solution_"
7. Your pull request is merged and you are added to the [list of contributors](https://github.com/sbrink/phoenix_simple_form/graphs/contributors)

## License

[MIT](LICENSE.txt)
