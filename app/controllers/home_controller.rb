class HomeController < ApplicationController
  def index
    require 'net/http'
    $uri = URI('https://api.nomics.com/v1/currencies/ticker?key=cbb0c66bb0a2e32400cb99ffd8eee89b05cf05fd&ids')
    $response = Net::HTTP.get($uri)
    $coins = JSON.parse($response)
    $my_coins = %w[BTC ETH VSDT BNB USDC XRP SOL LUNA ADA DOGE AVAX DOT UST DOGE BUSD
                   SHIB WBTC MATIC NEAR CRO DAI]
  end

  def about; end

  def lookup
    require 'net/http'
    $uri = URI('https://api.nomics.com/v1/currencies/ticker?key=cbb0c66bb0a2e32400cb99ffd8eee89b05cf05fd&ids')
    $response = Net::HTTP.get($uri)
    $lookup_coin = JSON.parse($response)

    $symbol = params[:sym]

    $symbol = $symbol.upcase if $symbol
  end
end
