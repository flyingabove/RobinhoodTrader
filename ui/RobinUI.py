import plotly
import plotly.plotly as py
import plotly.graph_objs as go
from controller.GraphsController import GraphsController

plotly.tools.set_credentials_file(username='ChristianGao', api_key='HtQUrMsJYQ71LNlquGwq')

class RobinUI:

    def __init__(self):
        self.graphs_controller = GraphsController()

    def create_portfolio_pie(self):
        values, labels = self.graphs_controller.get_portfolio_ratios()

        trace = go.Pie(labels=labels, values=values)
        py.plot([trace])


### MAIN ###
main = RobinUI()
main.create_portfolio_pie()