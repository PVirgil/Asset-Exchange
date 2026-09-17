insert into public.assets(id,slug,symbol,name,asset_class,category,description) values
('ae_eq_aapl','apple','AAPL','Apple Inc.','Equities','Technology','Public equity'),
('ae_cr_btc','bitcoin','BTC','Bitcoin','Crypto','Digital Currency','Digital asset'),
('ae_co_gold','gold','XAU','Gold','Commodities','Precious Metals','Commodity'),
('ae_re_nyc','manhattan-residential-index','NYC-RES','Manhattan Residential Index','Real Estate','Residential','Modeled index'),
('ae_col_rolex','rolex-daytona-116500ln','DAYTONA','Rolex Daytona 116500LN','Collectibles','Watches','Collectible watch')
on conflict(id) do nothing;
