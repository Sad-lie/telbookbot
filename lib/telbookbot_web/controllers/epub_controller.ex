defmodule TelBookBotWeb.EpubController do
  use TelBookBotWeb, :controller

  import EpubExtract

  def unzip_and_parse_epub(epub_path, extract_path) do
    epub_file = File.read!(epub_path)
    :zip.unzip(epub_file, [{:cwd, extract_path}])
  end
s
  def parse(conn, _params) do
    epub_path = ""
    extract_pat
    File.mkdir_p!(extract_path)

    parsed_segments = unzip_and_parse_epub(epub_path, extract_path)
    render(conn, "_template.html", parsed_segments: parsed_segments)
  end
end
