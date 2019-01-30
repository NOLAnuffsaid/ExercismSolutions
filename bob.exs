defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) -> "Fine. Be that way!"
      yelling?(input) && asking?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      asking?(input) -> "Sure."
      true -> "Whatever."
    end

  end

  defp silent?(input) do
    "" == String.trim(input)
  end

  defp yelling?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end

  defp asking?(input) do
    String.ends_with?(input, "?")
  end
end
