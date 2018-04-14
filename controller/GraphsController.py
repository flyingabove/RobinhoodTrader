from repository import RobinhoodRepository

class GraphsController:

    def __init__(self):
        self.robin_repo = RobinhoodRepository.RobinhoodRepository()

    def get_portfolio_ratios(self):
        print "organizing portfolio!"
        portfolio = self.robin_repo.getPortfolio()
        portfolio_ratios = []
        tickers = []

        for position in portfolio:
            portfolio_ratios.append(float(position["quantity"]) * float(position["average_buy_price"]))
            tickers.append(position["name"])
        return portfolio_ratios, tickers

### MAIN ###
#controller = GraphsController();
#portfolio_ratios,tickers = controller.get_portfolio_ratios()
#print "test"