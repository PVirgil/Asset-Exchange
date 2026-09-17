export type AssetClass = "Equities"|"Crypto"|"Real Estate"|"Commodities"|"Collectibles"|"Private Markets"|"FX"|"Fixed Income"|"Digital";
export type Asset = {
 id:string; slug:string; symbol:string; name:string; assetClass:AssetClass; category:string;
 price:number; change:number; marketCap?:number; currency:string; liquidity:number; confidence:number;
 description:string; location?:string; updated:string; history:{date:string;value:number}[];
};
