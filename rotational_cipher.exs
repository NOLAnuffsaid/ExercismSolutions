defmodule RotationalCipher do

  @LOWERCASE_RANGE = ?a..?z
  @UPPERCASE_RANGE = ?A..?Z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.reduce("", fn c, acc -> "#{acc}#{shift_char(c, shift)}" end)
  end

  defp shift_char(char, shift) when char in @LOWERCASE_RANGE do
    shifted_char = char + shift
    if shifted_char in @LOWERCASE_RANGE, do: [shifted_char], else: [(shifted_char - 122) + 96]
  end

  defp shift_char(char, shift) when char in @UPPERCASE_RANGE do
    shifted_char = char + shift
    if shifted_char in @UPPERCASE_RANGE , do: [shifted_char], else: [(shifted_char - 90) + 64]
  end

  defp shift_char(char, _shift), do: [char]
end
