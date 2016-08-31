require 'base64'

class CaptureController < ApplicationController

  def screen
    @base64 = Base64.encode64(binary)
  end

  def connect
    send_data binary, type: 'image/jpeg', disposition: 'inline'
  end

  private

  def binary
    path = "#{Rails.root}/tmp/test.jpg"
    img = File.open(path, 'r')
    img.read
  end

end
