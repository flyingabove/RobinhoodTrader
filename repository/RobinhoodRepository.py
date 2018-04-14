from robinhood import Robinhood
import yaml
import urllib2
stream = open("../credentials/credentials.yml", "r")
credentials = yaml.load(stream)

class RobinhoodRepository:

    def __init__(self):
        self.robinhood_trader = Robinhood();
        self.robinhood_trader.login(username=credentials.get("robinhoodUsr"), password=credentials.get("robinhoodPwd"))

    def getStockQuote(self, ticker):
        quote = self.robinhood_trader.get_quote(ticker)
        return quote

    def getPortfolioValue(self):
        portfolioValue = self.robinhood_trader.portfolios();
        return portfolioValue

    def getPortfolio(self):
        print "fetching portfolio!"
        portfolio = self.robinhood_trader.securities_owned()["results"];
        returnPortfolio = []
        for position in portfolio:
            name = self.robinhood_trader.instrument_name_by_url(position["instrument"]);
            position["name"] = name
            returnPortfolio.append(position)
        return returnPortfolio

    def buyStock(self, ticker):
        # Note: Sometimes more than one instrument may be returned for a given stock symbol
        stock_instrument = self.robinhood_trader.instruments(ticker)[0]
        buy_order = self.robinhood_trader.place_buy_order(stock_instrument, 1)
        print buy_order


### MAIN ###
robinhood_repo = RobinhoodRepository();
portfolio = robinhood_repo.getPortfolioValue()
print portfolio
print "Test"

    # Prompt for a symbol
    # robinhood_trader.print_quote();

    # Print multiple symbols
    #robinhood_trader.print_quotes(stocks=["BBRY", "FB", "MSFT"])

    # View all data for a given stock ie. Ask price and size, bid price and size, previous close, adjusted previous close, etc.
    # quote_info = my_trader.quote_data("GEVO")
    # print(quote_info);

    # Place a buy order (uses market bid price)
    # buy_order = my_trader.place_buy_order(stock_instrument, 1)
    # print buy_order
    # Place a sell order
    # sell_order = my_trader.place_sell_order(stock_instrument, 1)