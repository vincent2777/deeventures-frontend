/*
* Base URL
*/
// const String baseURL = "http://10.0.2.2:5000/api/v1"; //  Emulator
// const String baseURL = "http://192.168.0.35:5000/api/v1"; // Development
const String baseURL = "http://192.168.53.250:5000/api/v1"; // Development
// const String baseURL = "https://deeventures.com/api/v1";  // Production


/*
* Auth API Routes.
*/
const String loginUserRoute = "/users/login";
const String registerUserRoute = "/users/signup";

/*
* Users API Routes.
*/
const String getSingleUserRoute = "/users/single_user";
const String updateUserRoute = "/users/update_user";
const String deleteUserRoute = "/users/delete_user";
const String getTopTradersRoute = "/users/get_top_traders";

/*
* Wallet API Routes.
*/
const String getUserWalletRoute = "/wallets/user_wallet";
const String getUserReferralWalletRoute = "/wallets/user_referral_wallet";
const String depositMoneyRoute = "/wallets/deposit_money";

/*
* Cryptocurrency API Routes.
*/
const String getCryptocurrenciesRoute = "/currencies/all_currencies";
const String sellCryptocurrencyRoute = "/transactions/create_transaction";
const String getCryptocurrencyRoute = "https://api.pro.coinbase.com/products";
// https://api.pro.coinbase.com/products/BTC-USD/candles?granularity=86400
// https://api.kucoin.com/api/v1/market/candles?type=1day&symbol=BTC-USDT
// https://api-pub.bitfinex.com/v2/candles/trade:1D:tBTCUSD/hist
// https://api.kraken.com/0/public/OHLC?pair=XBTUSD&interval=1440
// https://www.okex.com/api/v5/market/candles?instId=BTC-USDT&bar=1D

/*
* Gift Card API Routes.
*/
const String getGiftCardsRoute = "/gift_cards/all_gift_cards";
const String getGiftCardRoute = "/gift_cards/single_gift_card";

/*
* Bill Payment API Routes.
*/
const String getAirtelRoute = "/networks/all_airtime";
const String buyAirtimeRoute = "/bills_payment/buy_airtime";

const String getInternetServiceProvidersRoute = "/bills_payment/all_data_bundles";
const String getInternetServiceProvidersCommissionRoute = "/data_plans/single_data_plan";
const String buyInternetRoute = "/bills_payment/buy_data_bundle";

const String getElectricityCompaniesRoute = "/bills_payment/all_electric_companies";
const String getMeterTypesRoute = "/electricity_companies/all_meter_types";
const String getElectricityCompaniesCommissionRoute = "/electricity_companies/single_electricity_company";
const String buyElectricityRoute = "/bills_payment/buy_electricity";

const String getCableTVRoute = "/bills_payment/all_cable_tv";
const String getCableTVCommissionRoute = "/cable_tvs/single_cable_tv";
const String buyCableTVRoute = "/bills_payment/buy_cable_tv";


/*
* Transaction API Routes.
*/
const String getTransactionsRoute = "/transactions/all_transactions";


/*
* Settings API Routes.
*/


/*
* General API Routes.
*/
const String getAccountSettingRoute = "/settings/setting";
const String uploadTransactionProofRoute = "/transactions/upload_transaction_proof";