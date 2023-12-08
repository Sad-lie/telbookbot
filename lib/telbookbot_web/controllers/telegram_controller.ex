defmodule TelbookbotWeb.TelegramController do
  use TelbookbotWeb, :controller

  def handle_message(conn, params) do
    chat_id = params["message"]["chat"]["id"]
    text = params["message"]["text"]

    response_text =
      case String.downcase(text) do
        "hello" ->
          "Hi there!"

        "quote" ->
          #output
          "Here's a quote: ...# "#{output}"

        _ ->
          "I didn't understand that."
      end

      Telbookbot.Telegram.send_message(chat_id, response_text)
    send_resp(conn, 200, "OK")
  end
end
