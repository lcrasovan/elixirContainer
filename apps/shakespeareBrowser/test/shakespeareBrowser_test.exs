defmodule ShakespeareBrowserTest do
  use ExUnit.Case
  doctest ShakespeareBrowser

  test "to be or not to be" do
    assert 1 + 1 == 2
  end

  test "counting words in phrases" do
    #cumulating phrases - super text enters super test
    text = ["hey jude", "hey jude hey"]
    assert WordCount.text_count(text) == %{hey: 3, jude: 2}
  end

  test "reading from file line by line into array" do

    text = []
    filename = "test/fixtures/hamlet.txt"
    if File.exists?(filename) do
      stream = File.stream!(filename, [:read, :utf8])
      text = Enum.reduce stream, text, fn(line, listing) ->
               [process_line(line)] ++ [listing]
             end
      end
    assert WordCount.text_count(text) == %{FRANCISCO: 1, BERNARDO: 1, Enter: 1, Nay: 1, "Who's": 1, and: 1, answer: 1, at: 1, him: 1, his: 1, me: 1, post: 1, stand: 1, there: 1, to: 1, unfold: 1, yourself: 1}
  end

  def process_line(line) do
    line
      |> String.strip
      |> String.replace(".", " ")
      |> String.replace(",", " ")
      |> String.replace(":", " ")
      |> String.replace(";", " ")
      |> String.replace("?", " ")
  end

end
