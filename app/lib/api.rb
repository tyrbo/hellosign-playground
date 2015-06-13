require 'hello_sign'

class Api
  attr_reader :client, :client_id

  def initialize
    @client = HelloSign::Client.new(api_key: ENV["HELLOSIGN_API_KEY"])
    @client_id = ENV["HELLOSIGN_CLIENT_ID"]
  end

  def create_embedded_template_draft(title = nil, subject = nil, message = nil)
    request = client.create_embedded_template_draft(
      test_mode: 1,
      client_id: client_id,
      file_url: ["https://gist.githubusercontent.com/tyrbo/37a6cfcc3d130611e65d/raw/273c1a9ffdc201dbca7d19b275bf1cbc88aaa4cb/example.txt"],
      title: title,
      subject: subject,
      message: message,
      signer_roles: [
        { name: "Role 1", order: 1 },
        { name: "Role 2", order: 2 }
      ]
    )

    request.data
  end
end
