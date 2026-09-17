export type Quote={symbol:string;price:number;change:number;timestamp:string};
export async function fetchQuote(symbol:string):Promise<Quote|null>{
 const base=process.env.MARKET_DATA_BASE_URL, key=process.env.MARKET_DATA_API_KEY;
 if(!base||!key) return null;
 const r=await fetch(`${base.replace(/\/$/,"")}/quote?symbol=${encodeURIComponent(symbol)}`,{headers:{Authorization:`Bearer ${key}`},cache:"no-store"});
 if(!r.ok) throw new Error(`Provider returned ${r.status}`);
 const d=await r.json();
 return {symbol,price:Number(d.price),change:Number(d.change??0),timestamp:d.timestamp??new Date().toISOString()};
}
