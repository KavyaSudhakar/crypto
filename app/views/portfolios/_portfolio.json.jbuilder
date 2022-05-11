json.extract! portfolio, :id, :symbol, :user_id, :cost_per, :amount_owned, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
