export function money(n:number,currency="USD"){
 return new Intl.NumberFormat("en-US",{style:"currency",currency,maximumFractionDigits:n<100?2:0}).format(n);
}
export function compact(n?:number){ if(n==null)return "—"; return new Intl.NumberFormat("en-US",{notation:"compact",maximumFractionDigits:2}).format(n); }
export function pct(n:number){ return `${n>=0?"+":""}${n.toFixed(2)}%`; }
