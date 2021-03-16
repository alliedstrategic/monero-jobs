# frozen_string_literal: true

module ApplicationHelper
  # fetch asset from crypto asset hash
  # based on crypto set in cookies
  def fetch_crypto_asset(val)
    if request.host == 'www.bitcoincashjobs.com'
      cookies[:coin] = 'bch'
    elsif request.host === 'www.monerojobs.com'
      cookies[:coin] = 'xmr'
    elsif request.host === 'www.ethereumjobs.dev'
      cookies[:coin] = 'eth'
    elsif request.host === 'www.dogecoinjobs.com'
      cookies[:coin] = 'doge'
    elsif request.host === 'www.hexjobs.com'
      cookies[:coin] = 'hex'
    elsif request.host === 'localhost'
      cookies[:coin] = 'hex'
    end

    crypto = cookies[:coin] ||= 'xmr'

    CRYPTO[
      crypto.to_sym
    ][val]
  end
end
